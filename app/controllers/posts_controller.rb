class PostController < ApplicationController

	# posts#index action
	get '/posts' do 
		@posts = Post.all
		erb :"posts/index"
	end

	# posts#new action
	get '/posts/new' do
		erb :"posts/new"
	end

	# posts#show action
	get '/posts/:id' do
		@post = Post.find_by(params[:id])
		erb :"posts/show"
	end

	# posts#create action
	post '/posts' do
		@post = Post.new
		@post.title = params[:title]
		@post.content = params[:content]
		@post.save
		redirect to "posts/#{@post.id}"
	end

	# posts#edit action
	get '/posts/:id/edit' do
		@post = Post.find(params[:id])
		erb :"posts/edit"
	end

	# posts#update action
	post '/posts/:id' do
		@post = Post.find(params[:id])
		@post.title = params[:title]
		@post.content = params[:content]
		@post.save
		erb :"posts/#{@post.id}"
	end

	# posts#delete action
	delete '/posts/:id/delete' do
		@post = Post.find_by_id(params[:id])
		@post.delete
		redirect to :'posts/index'
	end

end