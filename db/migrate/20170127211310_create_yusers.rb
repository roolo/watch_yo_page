class CreateYusers < ActiveRecord::Migration[5.0]
  def change
    create_table :yusers do |t|
      t.string :username

      t.timestamps
    end
  end
end
