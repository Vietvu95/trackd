class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :portfolio
  has_many :portfolio_assets, through: :portfolio
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
