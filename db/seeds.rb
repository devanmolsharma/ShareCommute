# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Create Users

10.times do |i|

    res = URI.open('https://randomuser.me/api/')
    json_data = JSON.load(res)['results'][0]
    image_url  = json_data['picture']['thumbnail']

user = User.create(
        full_name:"#{json_data['name']['first']} #{json_data['name']['last']}",
        email:json_data["email"],
        address:"#{json_data['location']['city']} #{json_data['location']['state']}",
        password:'temp',
        password_confirmation:'temp'
    )
    user.profile_image.attach(io:URI.open(image_url),filename:"user#{i}.jpeg")

end

Category.all.each do |cat|
    usr = User.find(rand(5...10))

    10.times do |i|

        res = URI.open('https://randomuser.me/api/')
        json_data = JSON.load(res)['results'][0]

        ride = cat.rides.build(
            user:usr,
            seats:rand(1...4),
            price_share:rand(8...15),
            from:json_data['location']['timezone']["description"],
            to:"#{json_data['location']['city']} #{json_data['location']['state']}",
        )

        ride.save

    end
end

file = File.expand_path('../scraped_data.csv', __FILE__)
CSV.foreach(file) do |row|
    usr = User.find(rand(5...10))
    cat = Category.find(rand(1...4))
    ride = cat.rides.build(
        user:usr,
        seats:rand(1...4),
        price_share:rand(8...15),
        from:row[0],
        to:row[2],
    )

    ride.save
end


# Category.all.each do |cat|
#     usr = User.find(rand(5...10))

#     10.times do |i|

#         res = URI.open('https://randomuser.me/api/')
#         json_data = JSON.load(res)['results'][0]

#         ride = cat.rides.build(
#             user:usr,
#             seats:rand(1...4),
#             price_share:rand(8...15),
#             from:json_data['location']['timezone']["description"],
#             to:"#{json_data['location']['city']} #{json_data['location']['state']}",
#         )

#         ride.save

#     end
# end
