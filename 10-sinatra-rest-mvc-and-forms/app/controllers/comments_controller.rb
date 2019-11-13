# frozen_string_literal: true

require 'byebug'

class CommentsController < ApplicationController
  get '/comments' do
    @comments = Comment.all
    erb :index
  end

  get '/comments/new' do
    erb :new
  end

  get '/comments/:id' do
    @comment = Comment.find(params[:id])
    erb :show
  end

  get '/comments/:id/edit' do
    @comment = Comment.find(params[:id])
    erb :edit
  end

  patch '/comments/:id' do
    @comment = Comment.find(params[:id])
    @comment.update(title: params[:title], body: params[:body])
    redirect '/comments'
  end

  post '/comments' do
    Comment.create(params)
    redirect '/comments'
  end
end
