require 'rails_helper'

feature "user posts a new question" do
  scenario "passing: sees form" do

    visit new_question_path

    expect(page).to have_content "Quesiton Title"
    expect(page).to have_content "Question Body"
    expect(page).to have_selector("input[type=submit][value='Submit Question']")

  end

  scenario "passing: posts a question" do
    question1 = Question.new(
    title: "Help me.  This title needs to be at least 50 characters",
    question_body: "How Do I learn ROR?
    I need some help learning.  I am writing some more text so I go over the limit.
    I am writing some more text so I go over the limit.")

    visit new_question_path

    fill_in "question[title]", with: question1.title
    fill_in "question[question_body]", with: question1.question_body
    click_button "Submit Question"
    expect(page).to have_content question1.title
    expect(page).to have_content question1.question_body
  end

  # scenario "failing: posts a question" do
  #   question2 = Question.new(
  #   title: "Help us",
  #   question_body: "la di da")
  #
  #   visit new_question_path
  #
  #   fill_in "question[title]", with: question2.title
  #   fill_in "question[question_body]", with: question2.question_body
  #   click_button "Submit Question"
  #   expect(page).to have_content "Check the Question Criteria!"
  #   # expect(page).to_not have_content question2.title
  #   # expect(page).to_not have_content question2.question_body
  # end
end
