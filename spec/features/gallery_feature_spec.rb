require 'rails_helper'

feature 'portfolio' do

  context 'creating a new gallery' do
    let!(:test_gallery) { Gallery.create(name: 'Test Gallery') }

    feature 'when not signed in' do
      scenario 'shouldn\'t have the button to create a new gallery' do
        visit '/portfolio'
        expect(page).to_not have_link 'New Gallery'
      end

      scenario 'should see the galleries' do
        visit '/portfolio'
        expect(page).to have_content 'Test Gallery'
      end
    end

    feature 'when signed in' do
      before do
        visit(ENV['SIGN_IN'])
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
      end

      scenario 'should have a button' do
        visit '/portfolio'
        expect(page).to have_link 'New Gallery'
      end

      scenario 'by cliking "New Gallery" I should be redirected to the page to create a new gallery' do
        visit '/portfolio'
        click_link 'New Gallery'
        expect(page).to have_content 'Create a new gallery'
        expect(current_path).to eq "/portfolio/new"
      end

      scenario 'create a gallery' do
        visit '/portfolio/new'
        fill_in('Name', with: 'Test Gallery2')
        click_button 'Submit'
        expect(page).to have_content 'Test Gallery2'
        expect(current_path).to eq "/portfolio"
        click_link 'Delete Test Gallery2'
      end

      scenario 'delete a gallery' do
        visit '/portfolio'
        click_link 'Delete Test Gallery'
        expect(page).to_not have_content 'Test Gallery'
      end

      scenario 'edit a gallery' do
        visit '/portfolio'
        click_link 'Edit Test Gallery'
        fill_in('Name', with: 'Test')
        click_button 'Submit'
        expect(page).to have_content 'Test'
        expect(page).to_not have_content 'Test Gallery'
        click_link 'Delete Test'
      end
    end
  end
end