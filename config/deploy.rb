require 'bundler/capistrano'
require 'rvm/capistrano'

#App Settings
set :application, 'Josh_New_Site'
set :repository, 'git@example.com:me/my_repo.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/jaronoff/webapps/joshsite'
set :scm, :git

#Server Roles
role :web, "web432.webfaction.com"
role :app, "web432.webfaction.com"
role :db,  "web432.webfaction.com", :primary => true

#User Settings
set :user, "jaronoff"
set :scm_username, "jaronoff"
set :use_sudo, false
default_run_options[:pty] = true


# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  namespace :deploy do
  desc "Restart nginx"
  task :restart do
    run "#{deploy_to}/bin/restart"
  end
end

  after :finishing, 'deploy:cleanup'


end
