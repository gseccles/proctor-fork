require "test_helper"

class SurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey = surveys(:one)
  end

  test "should get index" do
    get surveys_url
    assert_response :success
  end

  test "should get show" do
    get survey_url(@survey)
    assert_response :success
  end

  test "should get new" do
    get new_survey_url
    assert_response :success
  end

  test "take action returns no questions when no role is provided" do
    get take_survey_url(@survey, format: :json)
    assert_response :success
    
    response_body = JSON.parse(response.body)
    assert_empty response_body['questions'], "Expected no questions when no role is provided"
  end

  test "take action returns only questions for specified role" do
    get take_survey_url(@survey, params: { role: 'software_engineer' }, format: :json)
    assert_response :success
    
    response_body = JSON.parse(response.body)
    questions = response_body['questions']
    
    assert_not_empty questions, "Expected to find questions for software_engineer role"
    questions.each do |question|
      assert_includes [nil, 'software_engineer'], question['role'], 
        "Question #{question['id']} has role #{question['role']}, expected either nil or 'software_engineer'"
    end
  end
end
