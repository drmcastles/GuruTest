class AddLevelAndCorrectDefault < ActiveRecord::Migration[6.1]
  def up
    change_column_default(:answers, :correct, false)
    change_column_default(:tests, :level, 1)
  end

  def down

  end
end
