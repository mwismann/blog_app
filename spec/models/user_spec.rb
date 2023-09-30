require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { double("User", name: 'John Doe', bio: 'This is a bio') }

  context 'Creating a new user' do
    it 'The user should have a name' do
      allow(user).to receive(:name).and_return('')
      allow(user).to receive(:valid?).and_return(false)
      expect(user).to_not be_valid
    end

    it 'Should return an empty array of posts' do
      allow(user).to receive(:last_three_posts).and_return([])
      expect(user.last_three_posts).to be_empty
    end

    it 'Should return the last three posts when posts exist' do
      post1 = double(title: 'Hobbie', text: 'Fly fishing')
      post2 = double(title: 'Music', text: 'Pink Floyd')
      post3 = double(title: 'Place', text: 'Patagonia')

      allow(user).to receive(:last_three_posts).and_return([post3, post2, post1])

      expect(user.last_three_posts).to eq([post3, post2, post1])
    end
  end
end