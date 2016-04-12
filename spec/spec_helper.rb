require 'rubygems'
require 'simplecov'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest-vcr'
require 'mocha/test_unit'
require 'vcr'
require 'factory_girl'

SimpleCov.start
SimpleCov.command_name 'test'

require 'mvg/live'

class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end

FactoryGirl.find_definitions

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :faraday
  c.default_cassette_options = { record: :new_episodes, serialize_with: :json, preserve_exact_body_bytes: true }
end

MinitestVcr::Spec.configure!
