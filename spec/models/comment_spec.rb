require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe 'コメント投稿機能' do
    context 'コメントが投稿できるとき' do
      it 'textが存在すると投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントが投稿できないとき' do
      it 'textが空だと投稿できない' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Text can't be blank"
      end
      it 'userが紐づいていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "User must exist"
      end
      it 'itemが紐づいていないと投稿できない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Item must exist"
      end
    end
  end
end
