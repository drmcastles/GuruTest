class AddAutorToTests < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :tests, :autor, foreign_key: {to_table: :users}
  end
end
