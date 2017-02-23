#is first responsible for loading our application environment, code, and libraries.#
#Loading the environment
require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#Starting Application
#use Rack::MethodOverride for patch & delete requests.
# use PostsController #MOUNTING A CONTROLLER

#You need to mount controllers because otherwise our Application
#wont know that we have a class to respond to those requests

#Everytime I add a controller
#1. Inherit from ApplicationController
#2. Mount the controller in config.ru
#All other controllers above ApplicationController with "use" instead of "run"
run ApplicationController

