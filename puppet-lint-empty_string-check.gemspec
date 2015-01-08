Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-empty_string-check'
  spec.version     = '0.1.0'
  spec.homepage    = 'https://github.com/camptocamp/puppet-lint-empty_string-check'
  spec.license     = 'Apache-2.0'
  spec.author      = 'Camptocamp'
  spec.email       = 'raphael.pinson@camptocamp.com'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'A puppet-lint plugin to check for parameters defaulting to the empty string.'
  spec.description = <<-EOF
    A puppet-lint plugin to check for parameters defaulting to the empty string.
  EOF

  spec.add_dependency             'puppet-lint', '~> 1.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'coveralls', '~> 0.7'
  spec.add_development_dependency 'rake'
end
