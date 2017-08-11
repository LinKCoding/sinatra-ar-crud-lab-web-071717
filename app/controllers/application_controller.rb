require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  patch '/posts/:id' do
    #binding.pry
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    redirects "/posts/#{@post.id}"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post.destroy

    erb :delete
  end

  get '/posts/:id/edit' do
    #binding.pry
    @post = Post.find(params[:id])
    erb :edit
  end
  #when patch, include the controller method:override

  get '/posts/:id' do
    #binding.pry
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts' do
    @post = Post.all
    erb :posts
  end

  post '/posts' do
    @post = Post.new(params)
    @post.save
    redirect '/posts'
  end

  get '/' do

  end
end
