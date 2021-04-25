class AddConstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :correct, false)
    change_column_null(:answers, :question_id, false)

    change_column_null(:categories, :title, false)

    change_column_null(:questions, :body, false)
    change_column_null(:questions, :test_id, false)

    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)


    change_column_null(:users, :first_name, false)
    change_column_null(:users, :last_name, false)
  end
end
