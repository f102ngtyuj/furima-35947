require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameとemail、passwordとpassword_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "passwordが6文字以上であれば登録できる" do
      @user.password = "abcd1234"
      @user.password_confirmation = "abcd1234"
      expect(@user).to be_valid
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do  
      @user.email = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが重複して存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailが空だと登録できない" do  
      @user.email = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@が無い場合、登録出来ない" do
      @user.email = 'kkkgmail.com'  
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角数字のみの場合は登録できない' do
      @user.password = '11111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end
    it 'passwordが半角英字のみの場合は登録できない' do
      @user.password = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end
    it 'passwordが全角の場合は登録できない' do
      @user.password = 'ＡＢＣＤ１２３４'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end
    it 'passwordとpassword_confirmationが一致していなければ登録出来ない' do
      @user.password = '00000000'
      @user.password_confirmation = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameが半角だと登録できない" do
      @user.last_name = 'ﾔﾏﾀﾞ'  
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name  is invalid. Input full-width characters")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameが半角だと登録できない" do
      @user.first_name = 'ﾀﾛｳ'  
      @user.valid?
      expect(@user.errors.full_messages).to include("First name  is invalid. Input full-width characters")
    end
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "last_name_kanaが半角だと登録できない" do
      @user.last_name_kana = 'ﾐｮｳｼﾞ'  
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana  is invalid. Input full-width katakana characters")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaが半角だと登録できない" do
      @user.first_name_kana = 'ﾅﾏｴ'  
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana  is invalid. Input full-width katakana characters")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
