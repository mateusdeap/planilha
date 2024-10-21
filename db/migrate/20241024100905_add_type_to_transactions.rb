class AddTypeToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :kind, :integer, default: 0
  end
end
