


#App Settings
set :application, 'ac_site'
set :repository, 'git@github.com:jaronoff/new_site.git'
set :branch, "master"

set :scm, :git
set :deploy_to, '/home/jaronoff/webapps/ac_site/'
set :keep_releases, 5

#Gems and Path settings

set :default_environment, { 
'PATH' = "/home/jaronoff/webapps/ac_site/bin:$PATH"
'GEM_HOME' = "/home/jaronoff/webapps/ac_site/gems"
}

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "web432.webfaction.com"									 # Your HTTP server, Apache/etc
role :app, "web432.webfaction.com"                   # This may be the same as your `Web` server
role :db,  "web432.webfaction.com", :primary => true # This is where Rails migrations will run




#User Settings
set :user, "jaronoff"
set :scm_username, "jaronoff"
set :use_sudo, false
default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }
set :deploy_via, :remote_cache



namespace :deploy do
  desc "Restart nginx"
  task :restart do
    run "#{deploy_to}/bin/restart"
  end
end

after "deploy", "deploy:migrate"



# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end