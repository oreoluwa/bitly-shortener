# frozen_string_literal: true

version = File.read(File.expand_path('VERSION', __dir__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'bitly-shortener'
  s.version     = version
  s.summary     = 'URL Shortener'
  s.description = 'Shorten URL with https://bitly.com'

  s.required_ruby_version     = '>= 2.5.0'
  s.required_rubygems_version = '>= 1.8.11'

  s.license = 'MIT'

  s.author   = 'Oreoluwa'
  s.email    = 'oreoluwa@outlook.com'
  s.homepage = 'https://oreoluwa.co'

  s.files = Dir['README.md', 'lib/**/*']

  s.require_path = 'lib'
  s.bindir       = 'bin'

  s.executables  = ['shorten']
end
