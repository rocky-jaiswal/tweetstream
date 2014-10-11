# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'tweetstream'
set :repo_url, 'https://github.com/rocky-jaiswal/tweetstream.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/opt/tweetstream'
set :sockets_path, Pathname.new("#{fetch(:deploy_to)}/shared/tmp/sockets/")
set :puma_state, fetch(:sockets_path).join('puma.state')

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  desc 'Symlink shared configs and folders on each release.'
  task :symlink_shared do
    on roles(:app), in: :sequence do
      within release_path do
        execute :ln , "-nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
      end
    end
  end

  desc 'build grunt app'
  task :grunt_build do
    on roles(:web), in: :sequence do
      within "#{release_path}/public/angular-app" do
        execute :npm, "install"
        execute :bower, "install"
        execute :grunt, "build"
      end
    end
  end

  desc 'restart puma'
  task :puma_restart do
    on roles(:app), in: :sequence do
      within release_path do
        execute :bundle, "exec pumactl -S #{fetch(:puma_state)} restart"
      end
    end
  end

  before :migrate, :symlink_shared
  after  :published, :grunt_build
  after  :finished, :puma_restart
end
