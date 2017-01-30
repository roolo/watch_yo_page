# frozen_string_literal: true
class CreateUsersWatchings < ActiveRecord::Migration[5.0]
  def change
    create_table :watchings_yusers do |t|
      t.belongs_to :watching
      t.belongs_to :yuser
    end
  end
end
