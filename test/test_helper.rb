require 'rubygems'
require 'bundler/setup'

require_relative '../lib/showtimes'
require 'minitest/autorun'
require 'mocha'
require 'vcr'
require "vcr"
require "minitest-vcr"
require "webmock"

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

WebMock.disable_net_connect!(:allow_localhost => true)

MinitestVcr::Spec.configure!
