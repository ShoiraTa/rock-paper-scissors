class CreateThrows < ActiveRecord::Migration[7.0]
  def change
    create_table :throws do |t|
      t.string :item

      t.timestamps
    end
  end
end
