class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
      t.references :post
      t.string :name
      t.text :about

      t.timestamps
    end
  end

  def self.down
    drop_table :things
  end
end
