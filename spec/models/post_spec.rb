require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の保存' do
    context 'カラムを投稿できるとき' do
      it 'titleとdescriptionを投稿できる' do
        expect(@post).to be_valid
      end
    end
    context 'カラムを投稿できないとき' do
      it 'titleが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'desprictionが空では投稿できない' do
        @post.description = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Description can't be blank")        
      end
      it 'ユーザーが紐づいていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end
