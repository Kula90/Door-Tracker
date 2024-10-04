# app/controllers/admin/admin_controller.rb
class Admin::AdminController < ApplicationController
  def index
    @users = User.all
    render template: 'admin/index'
  end
end
