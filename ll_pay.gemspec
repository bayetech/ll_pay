# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'll_pay/version'

Gem::Specification.new do |spec|
  spec.name          = 'll_pay'
  spec.version       = LlPay::VERSION
  spec.authors       = ['houdelin']
  spec.email         = ['houdelin@bayekeji.com']

  spec.summary       = 'An unofficial lianlian (for apple pay) pay gem.'
  spec.description   = 'Helping rubyist integration with lianlian pay(lianlianpay llpay) easier.'
  spec.homepage      = 'https://github.com/bayetech/ll_pay'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features)/}) } \
    - %w(CODE_OF_CONDUCT.md ll-pay.sublime-project Gemfile Rakefile ll_pay.gemspec bin/setup bin/console)
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'http', '>= 1.0.4', '< 3'
  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 11.3'
  spec.add_development_dependency 'rspec', '~> 3.5'
end
