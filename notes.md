a Create files & folders
	-	README.md
	-	LICENCE.md
	-	CONTRIBUTING.md
	-	spec folder
	-	public folder (for css, img and JS files)
	-	Gemfile
		source 'http://rubygems.org'

			gem 'sinatra'
			#For ORM management
			gem 'activerecord', :require => 'active_record'
			#To use ActiveRecord in Sinatra
			gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
			#To rake commands .ie run migrations, create, rollback etc.
			gem 'rake'
			#Add some more require dependencies
			gem 'require_all'
			#Our DB adapter gem
			gem 'sqlite3'
			gem 'thin'
			#To run server
			gem 'shotgun'
			gem 'pry'
			# For encryption
			gem 'bcrypt'
			gem "tux"

			group :test do
			  gem 'rspec'
			  gem 'capybara'
			  gem 'rack-test'
			  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
			end

	-	config.ru
		#is first responsible for loading our application environment, code, and libraries.#
		#Loading the environment
		require './config/environment'

		if ActiveRecord::Migrator.needs_migration?
		  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
		end

		#Starting Application
		#use Rack::MethodOverride for patch & delete requests.
		use PostsController #MOUNTING A CONTROLLER

		#You need to mount controllers because otherwise our Application
		#wont know that we have a class to respond to those requests

		#Everytime I add a controller
		#1. Inherit from ApplicationController
		#2. Mount the controller in config.ru
		#All other controllers above ApplicationController with "use" instead of "run"
		run ApplicationController
		



	- config/environment.rb
		# Connect up all the files in our application to the appropriate gems and to each other.
		ENV['SINATRA_ENV'] ||= "development"

		require 'bundler/setup'
		Bundler.require(:default, ENV['SINATRA_ENV'])

		ActiveRecord::Base.establish_connection(
		  :adapter => "sqlite3",
		  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
		)

		require_all 'app'



	-	db/migrate

	-	app/controllers/application_controller.rb
		require './config/environment'

		class ApplicationController < Sinatra::Base

		  configure do
		    set :public_folder, 'public'
		    set :views, 'app/views'
		    enable :sessions
		    set :session_secret, "pickaname"
		  end
		  end


	-	Rakefile
		#rake gives us the ability to quickly make files and setup automated tasks. We
		#define these in Rakefile. In the Rakefile, we'll require our config/evironment.rb
		#file to load up our environment, as well as "sinatra/activerecord/rake" to get
		#Rake tasks from the sinatra-activerecord gem.

		ENV["SINATRA_ENV"] ||= "development"

		# Type `rake -T` on your command line to see the available rake tasks.
		
		require_relative './config/environment'
		require 'sinatra/activerecord/rake'

	- .gitignore
		#https://gist.github.com/octocat/9257657

		# Compiled source #
		###################
		*.com
		*.class
		*.dll
		*.exe
		*.o
		*.so

		# Packages #
		############
		# it's better to unpack these files and commit the raw source
		# git has its own built in compression methods
		*.7z
		*.dmg
		*.gz
		*.iso
		*.jar
		*.rar
		*.tar
		*.zip

		# Logs and databases #
		######################
		*.log
		*.sql
		*.sqlite

		# OS generated files #
		######################
		.DS_Store
		.DS_Store?
		._*
		.Spotlight-V100
		.Trashes
		ehthumbs.db
		Thumbs.db


			2. $ bundle install

##########################
	-RESOURCES
			Routes
			http://www.sinatrarb.com/intro.html#Routes

			Rake
			http://rake.rubyforge.org/

			ERB templating
			http://www.stuartellis.name/articles/erb/