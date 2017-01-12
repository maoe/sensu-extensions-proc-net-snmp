# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "sensu-extensions-proc-net-snmp"
  spec.version       = "0.0.1"
  spec.authors       = ["Mitsutoshi Aoe"]
  spec.email         = ["maoe@foldr.in"]

  spec.summary       = %q{Collect metrics in /proc/net/snmp}
  spec.description   = %q{Collect metrics in /proc/net/snmp}
  spec.homepage      = "http://github.com/maoe/sensu-extensions-proc-net-snmp"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
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

  spec.add_dependency "sensu-extension"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sensu-logger"
  spec.add_development_dependency "sensu-settings"
  spec.add_development_dependency "eventmachine"
end
