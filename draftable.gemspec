# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{draftable}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Collin Miller}]
  s.date = %q{2011-05-23}
  s.description = %q{Classes you can include into your Ruby project and a command line tool to integrate with the Draftable authoring tool.}
  s.email = %q{collintmiller@gmail.com}
  s.executables = [%q{draftable}]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/draftable",
    "draftable.gemspec",
    "lib/draftable.rb",
    "lib/draftable/cli.rb",
    "lib/draftable/cli/tasks/dump.rb",
    "lib/draftable/cli/tasks/init.rb",
    "lib/draftable/cli/tasks/mailer.rb",
    "lib/draftable/cli/tasks/presenter.rb",
    "lib/draftable/mailer.rb",
    "lib/draftable/mailer/message.rb",
    "lib/draftable/presentation.rb",
    "lib/draftable/presentation/currency.rb",
    "lib/draftable/presentation/image.rb",
    "lib/draftable/presentation/label.rb",
    "lib/draftable/presentation/widget.rb",
    "lib/draftable/presenter.rb",
    "lib/draftable/presenter_collection.rb",
    "lib/draftable/templates/initializer.rb",
    "lib/draftable/templates/mailer.rb",
    "lib/draftable/templates/presenter.rb",
    "test/helper.rb",
    "test/test_draftable.rb"
  ]
  s.homepage = %q{http://github.com/collin/draftable}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.3}
  s.summary = %q{Ruby development tools and libraries for the Draftable authoring tool.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.1.0.beta1"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3.1.0.beta1"])
      s.add_runtime_dependency(%q<rails>, [">= 3.1.0.beta1"])
      s.add_runtime_dependency(%q<erector>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.1.0.beta1"])
      s.add_dependency(%q<actionpack>, [">= 3.1.0.beta1"])
      s.add_dependency(%q<rails>, [">= 3.1.0.beta1"])
      s.add_dependency(%q<erector>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.1.0.beta1"])
    s.add_dependency(%q<actionpack>, [">= 3.1.0.beta1"])
    s.add_dependency(%q<rails>, [">= 3.1.0.beta1"])
    s.add_dependency(%q<erector>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

