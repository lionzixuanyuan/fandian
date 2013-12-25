class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_num, :null => false
      t.float :original_price, :null => false
      t.float :current_price, :null => false
      t.string :phone, :null => false
      t.string :address, :null => false
      t.string :state, :null => false
      t.integer :user_id, :null => false
      t.integer :area_id, :null => false
      t.integer :shop_id, :null => false
      t.string :altphone
      t.text :notes

      t.timestamps
    end
  end
end
