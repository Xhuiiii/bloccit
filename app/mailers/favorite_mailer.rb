class FavoriteMailer < ApplicationMailer
	default from: "robyn.jh.liu@gmail.com"

	def new_comment(user, post, comment)
		headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     	headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     	headers["References"] = "<post/#{post.id}@your-app-name.example>"
 
	    @user = user
	    @post = post
	    @comment = comment

		mail(to: user.email, subject: "New comment on #{post.title}")
	end

	def new_post(post)
		headers["Message-ID"] = "<posts/#{post.id}@your-app-name.example>"
     	headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     	headers["References"] = "<post/#{post.id}@your-app-name.example>"

		@post = post

		mail(to: post.user.email, subject: "You have created #{post.title} and will now receive updates when it's commented on")
	end
end
