class AddPageNumbersToPages < ActiveRecord::Migration
  def change
    add_column :pages, :page_number, :integer
  end
end
