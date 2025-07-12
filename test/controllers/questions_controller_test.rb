require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @survey = surveys(:one)
    @question = questions(:one)
  end

  test "should get new" do
    get new_survey_question_url(@survey)
    assert_response :success
  end

  test "should create question" do
    assert_difference("Question.count") do
      post survey_questions_url(@survey), params: { 
        question: { 
          content: "Test question",
          question_type: "text",
          position: 1
        } 
      }
    end

    assert_redirected_to survey_url(@survey)
  end

  test "should create question with role" do
    assert_difference("Question.count") do
      post survey_questions_url(@survey), params: { 
        question: { 
          content: "What is your experience with Kubernetes?",
          question_type: "long_text",
          position: 2,
          role: "site_reliability_engineer"
        } 
      }
    end

    assert_redirected_to survey_url(@survey)
    
    question = Question.last
    assert_equal "site_reliability_engineer", question.role
  end

  test "should get edit" do
    get edit_survey_question_url(@survey, @question)
    assert_response :success
  end

  test "should update question" do
    patch survey_question_url(@survey, @question), params: { 
      question: { 
        content: "Updated content"
      } 
    }
    assert_redirected_to survey_url(@survey)
  end

  test "should destroy question" do
    assert_difference("Question.count", -1) do
      delete survey_question_url(@survey, @question)
    end

    assert_redirected_to survey_url(@survey)
  end
end
