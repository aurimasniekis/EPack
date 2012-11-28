# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'EPack/version'

Gem::Specification.new do |gem|
  gem.name          = "EPack"
  gem.version       = REGL::VERSION
  gem.authors       = ["Aurimas Niekis"]
  gem.email         = ["gcdsxs@gmail.com"]
  gem.description   = %q{EPack - Eagle Package Manager}
  gem.summary       = %q{EPack is advance Eagle package manager.}
  gem.homepage      = "http://epack.github.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('libeagle')
  gem.add_dependency('thor')
  gem.licenses = ['MIT', 'GPL-2']
end
