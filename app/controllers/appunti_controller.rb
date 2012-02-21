class AppuntiController < ApplicationController

  respond_to :json

  def index
    respond_with Appunto.where("user_id = 1").recente_da_data(2.month.ago)
  end

  def show
    respond_with Appunto.find(params[:id])
  end

  def create
    respond_with Appunto.create(params[:appunto])
  end

  def update
    respond_with Appunto.update(params[:id], params[:appunto])
  end

  def destroy
    respond_with Appunto.destroy(params[:id])
  end


end
