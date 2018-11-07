class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.string :synopsis

      t.timestamps null: false
    end
  end
end
