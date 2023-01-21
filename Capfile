require "capistrano/setup"
require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/bundler"
require "capistrano/rbenv"
require "capistrano/rails"
require "capistrano/passenger"

set :rbenv_type, :user
set :rbenv_ruby, "3.1.2"

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
