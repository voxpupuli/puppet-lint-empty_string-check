puppet-lint-empty_string-check
===============================

[![Build Status](https://img.shields.io/travis/puppet-community/puppet-lint-empty_string-check.svg)](https://travis-ci.org/puppet-community/puppet-lint-empty_string-check)
[![Gem Version](https://img.shields.io/gem/v/puppet-lint-empty_string-check.svg)](https://rubygems.org/gems/puppet-lint-empty_string-check)
[![Gem Downloads](https://img.shields.io/gem/dt/puppet-lint-empty_string-check.svg)](https://rubygems.org/gems/puppet-lint-empty_string-check)
[![Coverage Status](https://img.shields.io/coveralls/puppet-community/puppet-lint-empty_string-check.svg)](https://coveralls.io/r/puppet-community/puppet-lint-empty_string-check?branch=master)
[![Donated by Camptocamp](https://img.shields.io/badge/donated%20by-camptocamp-fb7047.svg)](#transfer-notice)

A puppet-lint plugin to check for variables assigned to the empty string.

## Installing

### From the command line

```shell
$ gem install puppet-lint-empty_string-check
```

### In a Gemfile

```ruby
gem 'puppet-lint-empty_string-check', :require => false
```

## Checks

### Variable assigned to the empty string

The empty string is true in the future parser. `undef` should be used instead for a false value for strings.


#### What you have done

```puppet
$foo = ''
```

#### What you should have done

```puppet
$foo = undef
```

Note: There are valid cases of assigning a variable to the empty string. You should use [control comment](http://puppet-lint.com/controlcomments/) to disable checks for these.


#### Disabling the check

To disable this check, you can add `--no-empty_string_assignment-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-empty_string_assignment-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('disable_empty_string_assignment')
```

## Transfer Notice

This plugin was originally authored by [Camptocamp](http://www.camptocamp.com).
The maintainer preferred that Puppet Community take ownership of the module for future improvement and maintenance.
Existing pull requests and issues were transferred over, please fork and continue to contribute here instead of Camptocamp.

Previously: https://github.com/camptocamp/puppet-lint-empty_string-check
