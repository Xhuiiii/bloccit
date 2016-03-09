require 'random_data'

#create users
5.times do
	User.create!(
		name: RandomData.random_name,
		email: RandomData.random_email,
		password: RandomData.random_sentence
		)
end
users = User.all
#Create topics
15.times do
	Topic.create!(
		name: RandomData.random_sentence,
		description: RandomData.random_paragraph
	)
end
topics = Topic.all

#Create posts
50.times do 
	Post.create!(
		user: users.sample,
		topic: topics.sample,
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

user = User.first
user.update_attributes!(
	email: 'robyn.liu@hotmail.com',
	password: 'coconut'
	)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"

