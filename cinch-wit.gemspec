lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'cinch/wit/version'

Gem::Specification.new do |spec|
  spec.name          = 'cinch-wit'
  spec.version       = Cinch::Wit::VERSION
  spec.authors       = ['Justin Workman']
  spec.email         = ['xtagon@gmail.com']
  spec.summary       = "A Cinch plugin for the Wit API"
  spec.description   = "A Cinch plugin to use Wit's natural language processing in your IRC bot"
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'cinch'
  spec.add_runtime_dependency 'wit'

  spec.add_development_dependency 'bundler', '>= 2.2.10'
  spec.add_development_dependency 'rake'
end
