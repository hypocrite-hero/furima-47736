require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  # 2. テストのグループ分け
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての入力事項が正しく存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    
  end
end
