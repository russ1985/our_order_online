class OurOrderOnlineTables < ActiveRecord::Migration
  def up
    create_table :party_orders do |t|
      t.references :order
      t.references :party

      t.timestamps
    end

    add_index :party_orders, :order_id
    add_index :party_orders, :party_id

    create_table :orders do |t|
      t.string :token

      t.timestamps
    end

    create_table :order_items do |t|
      t.string :description
      t.references :party_order

      t.timestamps
    end

    add_index :order_items, :party_order_id

    create_table :toppings do |t|
      t.string :description
      t.references :order_item

      t.timestamps
    end

    add_index :toppings, :order_item_id
  end

  def down
    [:party_orders, :orders, :order_items, :toppings].each do |t|
      drop_table t
    end
  end
end
