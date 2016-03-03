require 'random_data'

#Create posts
50.times do 
	Post.create!(
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
	)
end
posts = Post.all

#Create comments
100.times do
	Comment.create!(
		post: posts.sample,
		body: RandomData.random_paragraph
	)
end

#Create questions
100.times do
	Question.create!(
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph,
		resolved: false
	)
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
 
puts "Before unique post #{Post.count}"
#Create a post with a unique title and body
Post.find_or_create_by(title: 'a unique title', body: 'a unique body')
puts "After unique post #{Post.count}"

puts "Before unique comment #{Comment.count}"
Comment.find_or_create_by(body: 'comment unique body')
puts "after unique comment #{Comment.count}"

