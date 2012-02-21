class MainController < ApplicationController
  def index
    @appunti = Appunto.in_corso.where("user_id = 1").recente_da_data(2.month.ago)
  end
end
