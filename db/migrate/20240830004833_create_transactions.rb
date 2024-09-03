class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.datetime :date

      t.timestamps
    end
  end
end
