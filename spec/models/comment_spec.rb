require 'rails_helper'

RSpec.describe Comment do
	  let(:topic) {create(:topic)}
    let(:user) {create(:user)}
    let(:post){create(:post)}
  	let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }
 
  	it {is_expected.to belong_to(:post)}
  	it {is_expected.to belong_to(:user)}

  	it {is_expected.to validate_presence_of(:body)}
  	it {is_expected.to validate_length_of(:body).is_at_least(5)}

   describe "attributes" do
     it "responds to body" do
       expect(comment).to respond_to(:body)
     end
   end

   describe "after_create" do
    before do
      @another_comment = Comment.new(body: 'Comment Body', post: post, user: user)
    end

    it "sends an email to users who have favorited the post" do
      if user != post.user
        favorite = user.favorites.create(post: post)
      end
      expect(FavoriteMailer).to receive(:new_comment).with(user, post, @another_comment).and_return(double(deliver_now: true))
      @another_comment.save
    end

    it "does not send emails to users who havent favorited the post" do
      if user != post.user
        expect(FavoriteMailer).not_to receive(:new_comment)
      end
      @another_comment.save
    end
  end
  
end
