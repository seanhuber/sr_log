# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sr_log/version'

Gem::Specification.new do |spec|
  spec.name          = 'sr_log'
  spec.version       = SrLog::VERSION
  spec.authors       = ['Sean Huber']
  spec.email         = ['seanhuber@seanhuber.com']

  spec.summary       = 'Basic logger wrapper with automatic rotation'
  spec.homepage      = 'https://github.com/seanhuber/sr_log'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'coveralls', '~> 0.8'
end
