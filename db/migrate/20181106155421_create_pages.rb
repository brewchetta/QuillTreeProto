class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :content
      t.string :background

      t.timestamps null: false
    end
  end
end
