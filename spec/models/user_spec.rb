require 'rails_helper'

RSpec.describe "Userモデルに関するテスト", type: :model do
  # describe 'バリデーションのテスト' do
  #   subject { user.valid? }
    
  #   let!(:other_user) { create(:user) }
  #   let(:user) { create(:user) }   
    
  #   context 'nicknameカラム' do
  #     it '空欄でないこと' do
  #       user.nickname = ''
  #       is_expected.to eq false
  #     end

  #     it '30文字以下であること: 30文字は◯' do
  #       user.nickname = Faker::Lorem.characters(number: 30)
  #       is_expected.to eq true
  #     end
      
  #     it '30文字以下であること: 31文字は☓' do
  #       user.nickname = Faker::Lorem.characters(number: 31)
  #       is_expected.to eq false
  #     end
      
  #     it '一意性があること' do
  #       user.nickname = other_user.nickname
  #       is_expected.to eq false
  #     end
  #   end
  # end
 
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
    
    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    
    context 'Thankモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:thanks).macro).to eq :has_many
      end
    end
  end
end