require 'test_helper'

class ManageSurveyControllerTest < ActionDispatch::IntegrationTest

  test "should not create question with no answers" do
    question = Question.new
    question.question_title = "What is the meaning of life?"
    assert_not question.save, "Saved question without answers"
  end

  test "should not create question with no title" do
    question = Question.create()
    question.save(:validate => false)
    question.answers.create([{answer_title: "41"}, {answer_title: "42"}])
    assert_not question.save, "Saved question without question title"
  end

  test "should not create question with one answer" do
    question = Question.create(question_title: "What is the meaning of life?")
    question.save(:validate => false)
    question.answers.create(answer_title: "42")
    assert_not question.save, "Saved question with one answer"
  end

  test "should not create question with five answers" do
    question = Question.create(question_title: "What is the meaning of life?")
    question.save(:validate => false)
    question.answers.create([{answer_title: "41"}, {answer_title: "42"}, {answer_title: "43"}, {answer_title: "44"}, {answer_title: "45"}])
    assert_not question.save, "Saved question with five answers"
  end

  test "should not create answer that is not linked to a question" do
    answer = Answer.create()
    assert_not answer.save, "Saved orphan answer"
  end

  test "should create question" do
    question = Question.create(id: 44, question_title: "What is the meaning of life?")
    question.save(:validate => false)
    question.answers.create([{answer_title: "41"}, {answer_title: "42"}, {answer_title: "43"}])
    question.save
    aQuestion = Question.find(id = 44)
    assert question.question_title == aQuestion.question_title, "Didn't get the same question title with the same question id"
  end

end
