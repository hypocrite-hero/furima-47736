require 'rails_helper'

RSpec.describe User, type: :model do
  # 1. まずはテストデータの準備（FactoryBotで1人分作る）
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

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      # ここにどんどん「できないパターン」を足していく！
    end
  end
end
