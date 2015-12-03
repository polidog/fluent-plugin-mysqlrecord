# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-mysqlrecord"
  spec.version       = "0.0.1"
  spec.authors       = ["polidog"]
  spec.email         = ["polidogs@gmail.com"]
  spec.summary       = %q{test}
  spec.description   = %q{test}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "fluentd"
end
