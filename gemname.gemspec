Gem::Specification.new do |s|
  s.authors               = ["Josiah Kiehl"]
  s.email                 = ["josiah@skirmisher.net"]
  s.description           = %q{oCaptures vagrant events and notifies an external service.}
  s.summary               = s.description
  s.homepage              = "https://gh.riotgames.com/jkiehl/vagrant_notify"
  s.files                 = `git ls-files`.split($\)
  s.executables           = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files            = s.files.grep(%r{^(test|spec|features)/})
  s.name                  = "vagrant_notify"
  s.require_paths         = ["lib"]
  s.version               = '0.0.1' # TODO jk: thor-scmversion

  s.add_dependency 'vagrant', '~> 1.0.5'
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
