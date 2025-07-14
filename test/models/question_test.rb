require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  test "should allow nil role" do
    question = Question.new(
      survey: surveys(:one),
      content: "Test question",
      question_type: "text",
      role: nil
    )
    assert question.valid?, "Question with nil role should be valid"
  end

  test "should convert empty role string to nil" do
    question = Question.new(
      survey: surveys(:one),
      content: "Test question",
      question_type: "text",
      role: ""
    )
    assert question.valid?, "Question with empty role string should be valid"
    assert_nil question.role, "Empty role string should be converted to nil"
  end

  test "should convert blank role string to nil" do
    question = Question.new(
      survey: surveys(:one),
      content: "Test question",
      question_type: "text",
      role: "   "
    )
    assert question.valid?, "Question with blank role string should be valid"
    assert_nil question.role, "Blank role string should be converted to nil"
  end

  test "should accept valid role" do
    question = Question.new(
      survey: surveys(:one),
      content: "Test question",
      question_type: "text",
      role: "software_engineer"
    )
    assert question.valid?, "Question with valid role should be valid"
    assert_equal "software_engineer", question.role, "Role should remain unchanged"
  end
end
