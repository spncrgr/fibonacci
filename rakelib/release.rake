# frozen_string_literal: true

namespace :docker do
  desc 'Build the Fibonacci Docker image'
  task :build, %i[file tag path] => [:bundle] do |_, args|
    check_install_task = Rake::Task[:check_install]
    check_install_task.reenable if check_install_task.already_invoked
    check_install_task.invoke('docker')

    command = %w[docker build]
    command << "--file=#{args.file}"
    command << "--tag=#{args.tag}"
    command << args.path
    sh command.join(' ')

    latest_tag = args.tag.sub(/:.+/, ':latest')
    sh %(docker tag #{args.tag} #{latest_tag})

    # Restore local Bundler environment to "dev mode"
    clean_task = Rake::Task[:clean]
    clean_task.reenable if clean_task.already_invoked
    clean_task.invoke
    sh %(bundle install)
  end

  desc 'Push the Fibonacci image to Docker Hub'
  task :push, [:tag] do |_, args|
    sh %(docker push #{args.tag})
  end
end
