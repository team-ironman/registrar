require "bundler/capistrano"
  
set :application, "registrar"
set :repository,  "git@github.com:flatiron-school/registrar.git"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'deploy'
set :deploy_to, "/home/#{user}/#{application}"
set :use_sudo, false
set :rails_env, "production"

set :scm, :git

default_run_options[:pty] = true

role :web, "192.81.213.114"                          # Your HTTP server, Apache/etc
role :app, "192.81.213.114"                          # This may be the same as your `Web` server
role :db, "192.81.213.114", :primary => true


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

before "bundle:install", "customs:config"
after "bundle:install", "customs:update_crontab"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace(:customs) do

  task :config do
    run "#{sudo} ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "#{sudo} ln -nfs #{shared_path}/config/environments/private_settings.rb #{release_path}/config/environments/private_settings.rb"
  end

  task :update_crontab, :roles => :app, :except => { :no_release => true } do
    run "cd #{release_path} && bundle exec whenever --update-crontab #{application}"
  end    
end



