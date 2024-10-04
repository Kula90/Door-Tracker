# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attribute :admin, :boolean, default: false

  def admin?
    admin
  end
end