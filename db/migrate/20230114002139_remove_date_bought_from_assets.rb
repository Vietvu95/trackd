class RemoveDateBoughtFromAssets < ActiveRecord::Migration[7.0]
  def change
    remove_column :assets, :date_bought
  end
end
