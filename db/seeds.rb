5.times do |number|
    User.create(
        email: "testuser#{number + 1}@asdf.com",
        password: "password#{number + 1}",
        password_confirmation: "password#{number + 1}"
    )
end

50.times do |number|
    Post.create(
        title: Faker::Movies::Lebowski.character,
        content: Faker::Movies::Lebowski.quote,
        user_id: rand(1..5)
    )
end