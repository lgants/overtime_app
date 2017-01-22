require 'rails_helper'

describe 'navigate' do
  before do
    user = User.create(first_name: "Jon", last_name: "Doe", email: "test@test.com", password: "password", password_confirmation: "password")
    login_as(user, :scope => :user)
    visit new_post_path
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'it has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'it has a list of Posts' do
      Post.create(date: Date.today, rationale: "test1")
      Post.create(date: Date.today, rationale: "test2")
      # need to rerun this because when it first loads in do block test content won't be populated
      visit posts_path
      expect(/test1|test2/)
    end
  end

  describe 'creation' do
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "test rationale"
      click_on "Save"
      expect(page).to have_content("test rationale")
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "user association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("user association")
    end
  end
end
