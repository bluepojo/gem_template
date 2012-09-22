require 'rubygems'
require 'bundler'
require 'spork'

Spork.prefork do
  require 'rspec'
  require 'pp'
  require 'aruba/cucumber'
  require 'vcr'

  APP_ROOT = File.expand_path('../../../', __FILE__)

  ENV["BERKSHELF_PATH"] = File.join(APP_ROOT, "tmp", "berkshelf")

  Dir[File.join(APP_ROOT, "spec/support/**/*.rb")].each {|f| require f}

  Around do |scenario, block|
    VCR.use_cassette(scenario.title) do
      block.call
    end
  end

end

Spork.each_run do
  Berkshelf::RSpec::Knife.load_knife_config(File.join(APP_ROOT, 'spec/knife.rb'))
  
  require '{GEMNAME}'
end
