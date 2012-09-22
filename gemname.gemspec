Gem::Specification.new do |s|
  s.authors               = ["Josiah Kiehl"]
  s.email                 = ["josiah@skirmisher.net"]
  s.description           = %q{A description}
  s.summary               = s.description
  s.homepage              = "http://Awebsite.com"
  s.files                 = `git ls-files`.split($\)
  s.executables           = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files            = s.files.grep(%r{^(test|spec|features)/})
  s.name                  = "{GEMNAME}"
  s.require_paths         = ["lib"]
  s.version               = Gemname::VERSION

  s.add_development_dependency 'thor'
  s.add_development_dependency 'thor-scmversion'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'aruba'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'spork'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-cucumber'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'guard-yard'
end
