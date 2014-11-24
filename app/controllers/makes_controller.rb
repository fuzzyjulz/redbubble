class MakesController < ApplicationController
  before_action :set_make
  
  def show
  end

  
  def set_make
    @make = Make.find(params[:make_id])
  end

end
