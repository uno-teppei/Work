require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    it 'full_name、email、passwordとpassword_confirmationが存在すれば登録できること' do
      user = build(:user)
      expect(user).to be_valid
    end
    it 'full_nameを入力していないとき登録できないこと' do
      expect(subject).not_to be_valid
      expect(subject.errors).not_to be_empty
    end
    it 'emailを入力していないとき登録できないこと' do
      expect(subject).not_to be_valid
      expect(subject.errors).not_to be_empty
    end
    it 'passwordを入力していないとき登録できないこと' do
      expect(subject).not_to be_valid
      expect(subject.errors).not_to be_empty
    end
    it '重複したメールアドレスが存在するとき登録できないこと' do
      user = create(:user)
      subject.email = user.email
      expect(subject).not_to be_valid
      expect(subject.errors[:email]).to include('はすでに存在します')
    end
  end
end
