class AddBelongs < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :tests, :category, foreign_key: true
    add_belongs_to :questions, :test, foreign_key: true
    add_belongs_to :answers, :question, foreign_key: true
  end
end
