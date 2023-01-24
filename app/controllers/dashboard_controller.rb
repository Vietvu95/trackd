class DashboardController < ApplicationController
  def dashboard
  end

  def dashboard_data
    @total_current_value = current_user.total_portfolios_value.round(2)
    @total_purchase_value = current_user.total_portfolios_purchase_value.round(2)
    @total_pl = (@total_current_value - @total_purchase_value).round(2)
    @portfolio_assets = current_user.portfolio_assets
  end
end
