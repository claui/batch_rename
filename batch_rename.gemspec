# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'batch_rename/version'

Gem::Specification.new do |spec|
  spec.name          = "batch_rename"
  spec.version       = BatchRename::VERSION
  spec.licenses      = ["ISC"]
  spec.authors       = ["Claudia"]
  spec.email         = ["dieclau@eml.cc"]

  spec.summary       = "Batch rename files in OS X using an interactive editor"
  spec.description   = <<-EOF
This gem provides a CLI command `batch-rename` to bulk rename files in OS&nbsp;X using an interactive text editor. It has been inspired by a question on Stack Exchange.
  EOF
  spec.homepage      = "http://github.com/claui/batch_rename"

  all_files = `git ls-files -z`.split(" ")
  spec_test_files, spec.files = all_files.partition do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   = ["batch-rename"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.3.15"
  spec.add_development_dependency "rake", "~> 13.0.6"
  spec.add_development_dependency "rspec", "~> 3.11"
end
