# frozen_string_literal: true

class AuthorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @authors = Author.all
    render json: @authors, only: %i[id name], include: [:books]
  end

  def create
    byebug
  end
end
