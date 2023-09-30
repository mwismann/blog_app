require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Thom Yorke', bio: 'This is a bio') }
  let(:post) { Post.new(author: user, title: 'Hobbie', text: 'Singing', comments_counter: 0, likes_counter: 0) }

  context 'Creating a new Post' do
    it 'Should have a title' do
      post.title = ''
      expect(post).to_not be_valid
    end

    it 'Title should have a maximum length of 250' do
      post.title = '
      Radiohead are an English rock band formed in Abingdon, Oxfordshire, in 1985. The band consists of Thom Yorke (vocals, guitar, piano, keyboards); the brothers Jonny Greenwood (guitar, keyboards, other instruments) and Colin Greenwood (bass); Ed O\'Brien (guitar, backing vocals); and Philip Selway (drums, percussion). They have worked with the producer Nigel Godrich and the cover artist Stanley Donwood since 1994. Radiohead\'s experimental approach is credited with advancing the sound of alternative rock.
      '
      expect(post).to_not be_valid
    end

    it 'Should not have comments' do
      expect(post.last_five_comments).to be_empty
    end

    it 'Like and comment counters should be integers' do
      expect(post.comments_counter).to be_an_instance_of(Integer)
      expect(post.likes_counter).to be_an_instance_of(Integer)
    end

    it 'Counters should be zero' do
      expect(post.comments_counter).to eq(0)
      expect(post.likes_counter).to eq(0)
    end

  end
end