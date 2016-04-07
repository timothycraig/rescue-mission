require 'rails_helper'

feature "sees questions" do
  scenario "passing: see all the questions" do
    question1 = Question.create(
    title: "Help me.  This title needs to be at least 50 characters",
    question_body: "How Do I learn ROR?
    I need some help learning.  I am writing some more text so I go over the limit.
    I am writing some more text so I go over the limit.")
    question2 = Question.create(
    title: "I need Help. This title needs to be at least 50 characters",
    question_body: "I want to learn how to set up
    some .js frameworks on my breakable toy.  Here is some more text to go over the limit.
    I am writing some more text so I go over the limit.")

    visit questions_path

    expect(page).to have_content(question1.title)
    expect(page).to have_content(question1.created_at)
    expect(page).to have_content(question1.updated_at)

    expect(page).to have_content(question2.title)
    expect(page).to have_content(question2.created_at)
    expect(page).to have_content(question2.updated_at)

    expect(question2.title).to appear_before(question1.title)
  end

  scenario "failing: see all the questions" do
    question1 = Question.create(title: "Help me", question_body: "How Do I learn ROR?
    I need some help learning.")
    question2 = Question.create(title: "I need Help.", question_body: "I want to learn how to set up
    some .js frameworks on my breakable toy.")

    visit questions_path

    expect(page).to_not have_content(question1.title)
    # expect(page).to_not have_content(question1.created_at)
    # expect(page).to_not have_content(question1.updated_at)
    expect(page).to_not have_content(question2.title)
    # expect(page).to_not have_content(question2.created_at)
    # expect(page).to_not have_content(question2.updated_at)
  end
end
