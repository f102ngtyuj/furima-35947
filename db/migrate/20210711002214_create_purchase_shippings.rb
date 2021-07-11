class CreatePurchaseShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_shippings do |t|

      t.timestamps
    end
  end
end
