# vim:ft=ruby:fileencoding=utf-8

require File.expand_path('../lib/cucumber-timed_formatter/version.rb', __FILE__)

spec = Gem::Specification.new do |s|
  s.name = "cucumber-timed_formatter"
  s.version = Cucumber::TimedFormatter::VERSION
  s.date = File.mtime(__FILE__)
  s.summary = "A progress-formatter with a little more info, instafailing."
  s.description = "A progress-formatter with a little more info: Each Scenario is one line and the time is measured. Additionally, errors are shown immediately to be a little like instafail.

  The Formatter is ideal for Jenkins line-by-line output."

  s.authors = ["Matthias Viehweger"]
  s.email = 'kronn@kronn.de'
  s.homepage = 'http://github.com/kronn/cucumber-timed_formatter'

  s.require_paths = ["lib"]
  s.files = `git ls-files`.split("\n") - ['.gitignore']
  # s.test_files = `git ls-files test`.split("\n")

  # s.rdoc_options = ['--charset=utf-8', '--fmt=shtml', '--all']
  s.rdoc_options = ['--charset=utf-8', '--all']
  # s.extra_rdoc_files = []

  s.add_dependency 'cucumber', '~> 2.0'

  # for release and doc generation, more less optional
  # s.add_development_dependency 'rake'
  # s.add_development_dependency 'rdoc', '>= 2.4.2'
  # s.add_development_dependency 'sdoc'
end
