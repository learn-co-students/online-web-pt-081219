class VerbsController < ApplicationController
  before_action :set_verb, only: [:show, :edit, :update, :destroy]
  def index
    @verbs = Verb.all
  end

  def create
    @verb = Verb.new(verb_params)
    if @verb.save
      redirect_to verbs_path
    else
      render 'new'
    end
  end

  def new
    @verb = Verb.new
  end

  def edit
  end

  def show
  end

  def update
    if @verb.update(verb_params)
      redirect_to verb_path(@verb)
    else
      render 'edit'
    end
  end

  def destroy
    @verb.destroy
    redirect_to verbs_path
  end

  private

  def verb_params
    #strong params
    params.require(:verb).permit(:infinitive)
  end

  def set_verb
    begin
      @verb = Verb.find(params[:id])
    rescue
      redirect_to verbs_path
    end
  end
end
