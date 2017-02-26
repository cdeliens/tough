# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tough/version'

Gem::Specification.new do |spec|
  spec.name          = "tough"
  spec.version       = Tough::VERSION
  spec.authors       = ["cdeliens"]
  spec.email         = ["deliens@me.com"]

  spec.summary       = %q{Password Validators including Dropbox ZXCVBN algorithim}
  spec.description   = %q{Password Validators including Dropbox ZXCVBN algorithim}
  spec.homepage      = "https://github.com/cdeliens/tough"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "activerecord", ">= 3.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest-utils"
  spec.add_development_dependency "pry-meta"
  spec.add_runtime_dependency "zxcvbn-ruby", "~> 0.1.1"
end
