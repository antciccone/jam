require 'rails_helper'

describe 'Categories' do
  context 'returns a users top categories' do
    it '.users_top_categories' do
      VCR.use_cassette("#users_top_categories") do

        user = User.create(token: ENV['USER_TOKEN'])

        top_categories = Categories.users_top_categories(user)

        expect(top_categories.first).to respond_to(:name)
        expect(top_categories.first).to respond_to(:image)
        expect(top_categories.first.name).to eq('Top Lists')

      end
    end
  end
end
