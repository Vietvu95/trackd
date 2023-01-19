class DashboardController < ApplicationController
  def dashboard
    @total_current_value = current_user.total_portfolios_value.round(2)
    @total_purchase_value = current_user.total_portfolios_purchase_value.round(2)
    @total_pl = (@total_current_value - @total_purchase_value).round(2)
  end
end
