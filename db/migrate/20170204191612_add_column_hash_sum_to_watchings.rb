class AddColumnHashSumToWatchings < ActiveRecord::Migration[5.0]
  def change
    add_column :watchings, :hash_sum, :string
  end
end
