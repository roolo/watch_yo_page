# frozen_string_literal: true
class CreateWatchings < ActiveRecord::Migration[5.0]
  def change
    create_table :watchings do |t|
      t.text :url

      t.timestamps
    end
  end
end
