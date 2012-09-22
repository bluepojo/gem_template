require 'rubygems'
require 'bundler'
require 'spork'
require 'vcr'

Spork.prefork do
  require 'rspec'
  require 'simplecov'
  require 'pp'
  require 'webmock/rspec'
  
  APP_ROOT = File.expand_path('../../', __FILE__)
  
  Dir[File.join(APP_ROOT, "spec/support/**/*.rb")].each {|f| require f}

  VCR.configure do |c|
    c.cassette_library_dir = File.join(File.dirname(__FILE__), 'fixtures', 'vcr_cassettes')
    c.hook_into :webmock
  end

  RSpec.configure do |config|
    config.mock_with :rspec
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run focus: true
    config.run_all_when_everything_filtered = true

    config.around do |example|
      # Dynamically create cassettes based on the name of the example
      # being run. This creates a new cassette for every test.
      cur = example.metadata
      identifiers = [example.metadata[:description_args]]
      while cur = cur[:example_group] do
        identifiers << cur[:description_args]
      end

      VCR.use_cassette(identifiers.reverse.join(' ')) do
        example.run
      end
    end
  end

  SimpleCov.start do
    add_filter 'spec/'
  end

end

Spork.each_run do
  require '{GEMNAME}'
end
