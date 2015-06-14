require 'rails_helper'

feature 'homepage' do
  scenario 'should display the links to other pages' do
    visit '/homepage'
    expect(page).to have_link 'Portfolio'
    expect(page).to have_link 'Packages & Prices'
    expect(page).to have_link 'About'
    expect(page).to have_link 'Contact'
  end
end