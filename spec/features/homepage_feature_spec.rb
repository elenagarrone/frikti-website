require 'rails_helper'

feature 'homepage' do
  scenario 'should display the links to other pages' do
    visit '/homepage'
    expect(page).to have_link 'Services'
    expect(page).to have_link 'Packages & Prices'
    expect(page).to have_link 'Gallery'
    expect(page).to have_link 'Contact'
  end
end