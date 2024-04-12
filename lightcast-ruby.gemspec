# frozen_string_literal: true

require_relative 'lib/lightcast-ruby/version'

Gem::Specification.new do |spec|
  spec.name = 'lightcast-ruby'
  spec.version = Lightcast::VERSION
  spec.authors = ['Jordan Ell']

  spec.summary = 'An API client for Lightcast in ruby.'
  spec.description = 'Access the Lightcast REST API.'
  spec.homepage = 'https://github.com/riipen/lightcast-ruby'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/riipen/lightcast-ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/riipen/lightcast-ruby/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '>= 2.0.1'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
