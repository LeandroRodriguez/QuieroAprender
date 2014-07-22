class PlansController < ApplicationController
  authorize_resource
  
  def index
    
  end
  
  def show
     @plan = Plan.find(params[:id])
  end
  
end
