class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :portfolios
  has_many :portfolio_assets, through: :portfolios
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def total_portfolios_value
    total = 0
    self.portfolios.each do |portfolio|
      total += portfolio.total_value
    end
    return total
  end

  def total_portfolios_purchase_value
    total = 0
    self.portfolios.each do |portfolio|
      total += portfolio.total_purchase_value
    end
    return total
  end
end
