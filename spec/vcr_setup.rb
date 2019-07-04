# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<api_key>') { ENV['GOODREADS_API_KEY'] }
  c.configure_rspec_metadata!
end