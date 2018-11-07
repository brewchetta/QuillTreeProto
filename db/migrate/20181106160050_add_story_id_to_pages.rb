class AddStoryIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :story_id, :integer
  end
end
