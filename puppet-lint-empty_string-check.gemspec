Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-empty_string-check'
  spec.version     = '1.0.0'
  spec.homepage    = 'https://github.com/voxpupuli/puppet-lint-empty_string-check'
  spec.license     = 'Apache-2.0'
  spec.author      = 'Vox Pupuli'
  spec.email       = 'voxpupuli@groups.io'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'A puppet-lint plugin to check for variables assigned to the empty string.'
  spec.description = <<-EOF
    A puppet-lint plugin to check for variables assigned to the empty string.
  EOF

  spec.add_dependency             'puppet-lint', '>= 1.0', '< 3.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'mime-types'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rake'
end
