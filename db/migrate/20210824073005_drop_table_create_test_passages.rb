class DropTableCreateTestPassages < ActiveRecord::Migration[6.1]
  def up
    drop_table :create_test_passages, if_exist: true
  end
end
