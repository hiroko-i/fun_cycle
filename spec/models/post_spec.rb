require 'rails_helper'

RSpec.describe "Postモデルに関するテスト", type: :model do
  # describe 'バリデーションのテスト' do
  #   subject { post.valid? }

  #   let(:post) { FactoryBot.create(:post) }
  #   let(:user) { FactoryBot.create(:post, user_id: user.id) }

  #   context 'imageカラム' do
  #     it '空欄でないこと' do
  #       post.image = ''
  #       is_expected.to eq false
  #     end
  #   end

  #   context 'titleカラム' do
  #     it '空欄でないこと' do
  #       post.title = ''
  #       is_expected.to eq false
  #     end

  #     it '50文字以下であること: 50文字は◯' do
  #       post.title = Faker::Lorem.characters(number: 50)
  #       is_expected.to eq true
  #     end

  #     it '50文字以下であること: 51文字は☓' do
  #       post.title = Faker::Lorem.characters(number: 51)
  #       is_expected.to eq false
  #     end
  #   end

  #   context 'explanationカラム' do
  #     it '空欄でないこと' do
  #       post.explanation = ''
  #       is_expected.to eq false
  #     end

  #     it '1000文字以下であること: 1000文字は◯' do
  #       post.explanation = Faker::Lorem.characters(number: 1000)
  #       is_expected.to eq true
  #     end

  #     it '1000文字以下であること: 1001文字は☓' do
  #       post.explanation = Faker::Lorem.characters(number: 1001)
  #       is_expected.to eq false
  #     end
  #   end

  #   context 'prefectureカラム' do
  #     it '空欄でないこと' do
  #       post.prefecture_id = ''
  #       is_expected.to eq false
  #     end
  #   end

  #   context 'placeカラム' do
  #     it '空欄でないこと' do
  #       post.place = ''
  #       is_expected.to eq false
  #     end
  #   end

  #   context 'addressカラム' do
  #     it '空欄でないこと' do
  #       post.address = ''
  #       is_expected.to eq false
  #     end
  #   end

  #   context 'genreカラム' do
  #     it '空欄でないこと' do
  #       post.genre = ''
  #       is_expected.to eq false
  #     end
  #   end
  # end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'PostTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_tags).macro).to eq :has_many
      end
    end

    context 'Tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:tags).macro).to eq :has_many
      end
    end

    context 'Thankモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:thanks).macro).to eq :has_many
      end
    end

    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
  end
end