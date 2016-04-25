require 'test_helper'

class RackModule
  class Called < StandardError; end
  attr_accessor :app

  def call(env)
    main_logic
  end

  def main_logic
    raise Called
  end
end

class Rack::SkippableTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Rack::Skippable::VERSION
  end

  def test_skip_when_condition_is_truthy
    skip_when = ->(env) { return true }
    r = rack_app(skip_when)
    assert_equal 'skipped', r.call({})
  end

  def test_not_skip_when_condition_is_falsey
    skip_when = ->(env) { return nil }
    r = rack_app(skip_when)
    assert_raises(RackModule::Called) do
      r.call({})
    end
  end

  private
  def rack_app(skip_when, app: proc { 'skipped' })
    rack_class = ::Rack::Skippable.wrap(RackModule, skip_when)
    r = rack_class.new
    r.app = app
    r
  end
end
