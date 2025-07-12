require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  def setup
    @survey = surveys(:one)
  end

  test "saves question with valid role" do
    question = @survey.questions.build(
      content: "MyText",
      question_type: "text",
      position: 1,
      role: "software_engineer"
    )
    assert question.save

    # Reload from database to ensure it was actually saved
    question_from_db = Question.find(question.id)
    assert_equal "software_engineer", question_from_db.role
  end

  test "rejects question with invalid role" do
    question = @survey.questions.build(
      content: "MyText",
      question_type: "text",
      position: 1,
      role: "invalid_role"
    )
    assert_not question.save
    assert_includes question.errors[:role], "is not included in the list"
  end
end
