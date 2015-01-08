puppet-lint-empty_string-check
=================================

[![Build Status](https://travis-ci.org/camptocamp/puppet-lint-empty_string-check.svg)](https://travis-ci.org/camptocamp/puppet-lint-empty_string-check)
[![Code Climate](https://codeclimate.com/github/camptocamp/puppet-lint-empty_string-check/badges/gpa.svg)](https://codeclimate.com/github/camptocamp/puppet-lint-empty_string-check)
[![Gem Version](https://badge.fury.io/rb/puppet-lint-empty_string-check.svg)](http://badge.fury.io/rb/puppet-lint-empty_string-check)
[![Coverage Status](https://img.shields.io/coveralls/camptocamp/puppet-lint-empty_string-check.svg)](https://coveralls.io/r/camptocamp/puppet-lint-empty_string-check?branch=master)

A puppet-lint plugin to check for variables assigned to the empty string.


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
