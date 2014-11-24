class ModelsController < ApplicationController
  before_action :set_model
  
  def show
  end

  def set_model
    @model = Model.find(params[:make_id], params[:model_id])
  end
end
