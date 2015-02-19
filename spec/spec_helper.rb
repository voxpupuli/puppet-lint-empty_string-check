unless RUBY_VERSION =~ /^1\.8/
  require 'coveralls'
  Coveralls.wear!
end

require 'puppet-lint'

PuppetLint::Plugins.load_spec_helper
