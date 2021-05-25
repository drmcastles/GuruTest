class ChangeCorrectNameToAuthor < ActiveRecord::Migration[6.1]
  def change
    rename_column :tests, :autor_id, :author_id
  end
end
