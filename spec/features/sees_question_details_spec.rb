require 'rails_helper'

feature "sees question details" do
  scenario "passing: see question details" do
    question1 = Question.create(
    title: "Help me.  This title needs to be at least 50 characters",
    question_body: "How Do I learn ROR?
    I need some help learning.  I am writing some more text so I go over the limit.
    I am writing some more text so I go over the limit.")

    visit question_path(question1)

    expect(page).to have_content(question1.title)
    expect(page).to have_content(question1.question_body)
  end
end
