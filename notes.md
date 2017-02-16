 Create files & folders
	-	README.md
	-	LICENCE.md
	-	CONTRIBUTING.md
	-	spec folder
	-	public folder
	-	Gemfile
		source 'http://rubygems.org'

			gem 'sinatra'
			#For ORM management
			gem 'activerecord', :require => 'active_record'
			#To use Activerecord in Sinatra
			gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
			#To rake commands .ie run migrations, create, rollback etc.
			gem 'rake'
			#Add some more require dependencies
			gem 'require_all'
			#Our DB
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
		use PostsController #MOUNTING A CONTROLLER

		#You need to mount controllers because otherwise our Application
		#wont know that we have a class to respond to those requests

		#Everytime I add a controller
		#1. Inherit from ApplicationController
		#2. Mount the controller in config.ru
		#All other controllers above ApplicationController with "use" instead of "run"
		run ApplicationController
		



	- config/environment.rb
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


	-	Rakefile

		ENV["SINATRA_ENV"] ||= "development"

		require_relative './config/environment'
		require 'sinatra/activerecord/rake'


	2. $ bundle install