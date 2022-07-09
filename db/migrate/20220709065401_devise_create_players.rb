# frozen_string_literal: true

class DeviseCreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.integer :score, :integer, default: 0

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :players, :email,                unique: true
    add_index :players, :reset_password_token, unique: true
    # add_index :players, :confirmation_token,   unique: true
    # add_index :players, :unlock_token,         unique: true
  end
end
