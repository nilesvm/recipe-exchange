require "rails_helper"

RSpec.feature "Visit single recipe", :type => :feature do
  let(:webuser) { create(:webuser) }
  let(:recipe) { create(:recipe) }

  scenario "User goes to a single recipe from the home page", js: true do
    recipe
    visit root_path
    page.find(".single-recipe-card").click
    expect(page).to have_selector('body .modal')
    page.find('.interested a').click
    expect(page).to have_selector('#single-recipe-content p', text: recipe.content)
  end

end