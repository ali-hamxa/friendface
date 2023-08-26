require 'csv'

# Clear existing data
Like.destroy_all
Post.destroy_all
User.destroy_all

csv_path = Rails.root.join('db', '../../friendface.csv') # Add this line

# Define user names from the CSV
user_names = CSV.read(csv_path, headers: true).map { |row| row['user'] }.uniq

# Create users
users = user_names.map do |name|
  User.create!(name: name)
end

# Load post data
post_data = {}

CSV.foreach(csv_path, headers: true) do |row|
  post_id = row['post-id']
  unless post_data.key?(post_id)
    post_data[post_id] = {
      title: "Title for Post #{post_id}",
      body: "Body for Post #{post_id}"
    }
  end
end

post_data.each do |post_id, attributes|
  Post.create!(attributes.merge(id: post_id))
end

# Create likes
CSV.foreach(csv_path, headers: true) do |row|
  post_id = row['post-id']
  user = User.find_by(name: row['user'])
  post = Post.find(post_id)

  Like.create!( likeable: post, user: user, date: row['date'])
end

puts 'CSV data loaded into the database.'
