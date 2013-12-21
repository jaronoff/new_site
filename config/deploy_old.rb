require 'bundler/capistrano'
 
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
 
set :user, "jaronoff"
set :application, 'Josh_New_Site'
set :repository, 'git@example.com:me/my_repo.git'
set :deploy_to, "/home/jaronoff/webapps/joshsite"
set :default_stage,"production"
set :assets_path, "#{deploy_to}/shared/assets"
set :verbose_command_log, true
 
set :use_sudo, false
set :deploy_via, :checkout
set :branch, "master"
 
set :default_environment, {
  'PATH' => "#{deploy_to}/bin:$PATH",
  'GEM_HOME' => "#{deploy_to}/gems",
  'RAILS_ENV' => "#{default_stage}"
}
 
set :scm, :git
role :web, "web432.webfaction.com"
role :app, "web432.webfaction.com"
role :db,  "web432.webfaction.com", :primary => true 
 
desc "Restart nginx"
task :restart do
  run "#{deploy_to}/bin/restart"
end
 
desc "Start nginx"
task :start do
  run "#{deploy_to}/bin/start"
end
 
desc "Stop nginx"
task :stop do
  run "#{deploy_to}/bin/stop"
end
 
namespace :deploy do
  
  puts "============================================="
  puts "SIT BACK AND RELAX WHILE CAPISTRANO ROCKS ON!"
  puts "============================================="
  
  desc "Seed database"
  task :remakedb do
    run "cd #{deploy_to}/current; bundle exec rake db:migrate RAILS_ENV=#{default_stage}"
    run "cd #{deploy_to}/current; bundle exec rake db:seed RAILS_ENV=#{default_stage}"
  end
  
  desc "Seed database"
  task :seed do
    run "cd #{deploy_to}/current; bundle exec rake db:seed RAILS_ENV=#{default_stage}"
  end
  
  desc "Migrate database"
  task :migrate do
    run "cd #{deploy_to}/current; bundle exec rake db:migrate RAILS_ENV=#{default_stage}"
  end
 
  namespace :assets do
    desc 'Run the precompile task locally and rsync with shared'
    task :precompile, :roles => :web, :except => { :no_release => true } do
      %x{bundle exec rake assets:precompile}
      %x{rsync --recursive --times --rsh=ssh --compress --human-readable --progress public/assets #{domain}:#{assets_path}}
      %x{bundle exec rake assets:clean}
    end
  end
  
end
 
after "deploy", "assets:precompile"
after "deploy", "deploy:migrate"
after "deploy", "restart"