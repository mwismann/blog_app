require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.new(name: 'Thom Yorke', bio: 'This is a bio') }
  let(:post) { Post.new(author: user, title: 'Hobbie', text: 'Singing', comments_counter: 0, likes_counter: 0) }

  describe 'update_comments_counter' do
    it 'Should return 0 initially' do
      expect(post.comments_counter).to eq(0)
    end
  end
end
