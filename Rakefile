
#rake gives us the ability to quickly make files and setup automated tasks. We
#define these in Rakefile. In the Rakefile, we'll require our config/evironment.rb
#file to load up our environment, as well as "sinatra/activerecord/rake" to get
#Rake tasks from the sinatra-activerecord gem.

ENV["SINATRA_ENV"] ||= "development"

# Type `rake -T` on your command line to see the available rake tasks.

require_relative './config/environment'
require 'sinatra/activerecord/rake'