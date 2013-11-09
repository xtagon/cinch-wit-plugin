Gem::Specification.new do |spec|
	spec.name          = 'cinch-wit'
	spec.version       = '0.0.1'
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

	spec.add_development_dependency 'bundler', '~> 1.3'
	spec.add_development_dependency 'rake'
end
