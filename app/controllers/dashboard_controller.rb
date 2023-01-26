class DashboardController < ApplicationController
  def dashboard
  end

  def dashboard_data

    if current_user.portfolio != nil
      @total_current_value = current_user.portfolio.total_value.round(2)
      @total_purchase_value = current_user.portfolio.total_purchase_value.round(2)
      @portfolio_assets = current_user.portfolio_assets
   else
      @total_current_value = 0
      @total_purchase_value = 0
   end
    @total_pl = (@total_current_value - @total_purchase_value).round(2)
  end
end
