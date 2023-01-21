lock "~> 3.17.1"

set :application, "bbq"
set :repo_url, "git@github.com:krywna/bbq.git"

set :deploy_to, "/home/deploy/www/bbq"

append :linked_files, "config/database.yml", "config/master.key", ".env"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

set :branch, ENV["BRANCH"] if ENV["BRANCH"]
