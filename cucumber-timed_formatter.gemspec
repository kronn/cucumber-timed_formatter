# vim:ft=ruby:fileencoding=utf-8

require File.expand_path('../lib/cucumber-timed_formatter/version.rb', __FILE__)

spec = Gem::Specification.new do |s|
  s.name = "cucumber-timed_formatter"
  s.version = Cucumber::Formatter::Timed::VERSION
  s.date = File.mtime(__FILE__)
  s.summary = "A progress-formatter with a little more info"
  s.description = "A progress-formatter with a little more info: Each Scenario is one line and the time is measured."

  s.authors = ["Matthias Viehweger"]
  s.email = 'kronn@kronn.de'
  s.homepage = 'http://github.com/kronn/cucumber-timed_formatter'
  s.rubyforge_project = '[none]' # to supress the warning

  s.require_paths = ["lib"]
  s.files = `git ls-files`.split("\n") - ['.gitignore']
  # s.test_files = `git ls-files test`.split("\n")

  s.rdoc_options = ['--charset=utf-8', '--fmt=shtml', '--all']
  # s.extra_rdoc_files = []

  s.add_dependency 'cucumber', '~> 0.4'

  # for release and doc generation, more less optional
  # s.add_development_dependency 'rake'
  # s.add_development_dependency 'rdoc', '>= 2.4.2'
  # s.add_development_dependency 'sdoc'
end
