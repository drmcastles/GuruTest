module QuestionsHelper
  def question_header(question)
    verb = question.new_record? ? 'New': 'Edit'
    content_tag(:h1, "#{verb} #{question.test.title.capitalize} Question")
  end
end
