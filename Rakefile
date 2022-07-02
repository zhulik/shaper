# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

require "rubocop/rake_task"
require "steep"
require "steep/cli"

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new

desc "Run steep check"
task :steep do
  Steep::CLI.new(argv: ["check"], stdout: $stdout, stderr: $stderr, stdin: $stdin).run
end

task default: %i[rubocop steep spec]
