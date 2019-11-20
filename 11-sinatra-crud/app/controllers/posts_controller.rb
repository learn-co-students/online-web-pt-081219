class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  # Great starting point because it's the easiest to test
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    post = Post.new(post_params)

    if post.save
      redirect '/posts'
    else
      puts "oooooohhhhh noooooo"
      redirect '/'
    end

  end

  get '/posts/:id' do
    set_post
    erb :show
  end

  get '/posts/:id/edit' do
    set_post
    erb :edit
  end

  patch '/posts/:id' do
    set_post
    if @post.update(post_params)
      redirect "/posts/#{@post.id}"
    else
      puts "could not update"
      redirect '/posts'
    end
  end

  delete '/posts/:id' do
    set_post
    @post.destroy
    redirect '/posts'
  end

  private

  def post_params
    { title: params[:title], author: params[:author], body: params[:body]}
  end

  def set_post
    @post = Post.find_by(id: params[:id])
    unless @post
      puts "#{params[:id]} is not a valid post"
      redirect '/'
    end
  end

end
