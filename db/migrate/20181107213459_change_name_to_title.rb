class ChangeNameToTitle < ActiveRecord::Migration
  def change
    rename_column :stories, :name, :title
  end
end
