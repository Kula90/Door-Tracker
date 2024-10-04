# app/controllers/floors_controller.rb
class FloorsController < ApplicationController
  def show
    @floor = Floor.find(params[:id])
  end
end
