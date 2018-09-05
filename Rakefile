# frozen_string_literal: true

load File.expand_path('init.rb', __dir__)

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test

VERSION_FILE        = File.expand_path("#{APP_ROOT}/VERSION")
CURRENT_APP_VERSION = File.read(VERSION_FILE)

desc 'Set new app version, build the Docker image, and push to Docker Hub'
task :release, [:version] do |_, args|
  args.with_defaults(version: CURRENT_APP_VERSION)
  # Write the new version number to the VERSION file
  File.write(VERSION_FILE, args.version)
  tag = "spncrgr/fibonacci:#{args.version}"

  build_task = Rake::Task['docker:build']
  build_task.reenable
  build_task.invoke('Dockerfile', tag, '.')

  push_task = Rake::Task['docker:push']
  push_task.reenable if push_task.already_invoked
  push_task.invoke(tag)
  push_task.reenable
  push_task.invoke('spncrgr/fibonacci:latest')
rescue
  # If any exception is thrown, restore the VERSION file content.
  File.write(VERSION_FILE, CURRENT_APP_VERSION)
end

task :clean do
  rm_rf %w[.bundle vendor]
end

task :check_install, [:tool] do |_, args|
  util = args.tool
  sh util, '-v' do |ok, _|
    raise "Unable to find #{util} on your $PATH, is it installed?" unless ok
  end
end

desc 'Package the production Gem dependencies in vendor/cache'
task :bundle, :clean do
  task = Rake::Task[:check_install]
  task.reenable
  task.invoke('bundle')
  # Set bundle configuration
  sh %(bundle config --local without dev:test)
  sh %(bundle pack)
end
