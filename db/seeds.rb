# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_list = [
    [
        "aa@aa.aa",
        "123456789Ps",
        "Aaaaa",
        "Bbbbb Ccccc",
        "Calle Falsa 123",
        "1992-05-03",
        Rails.root+"db/seed_files/user_1.jpeg",
        'user_1.jpeg'
    ],
    [
        "bb@aa.aa",
        "123456789Ps",
        "Aaaaa",
        "Bbbbb Ccccc",
        "Calle Falsa 123",
        "1992-05-03",
        Rails.root+"db/seed_files/user_1.jpeg",
        "user_1.jpeg"
    ]
]

users = []

users_list.each do |email, password, name, last_name, address, birth_date, img_path, img_name|
  users << User.create(
    email: email,
    password: password,
    name: name,
    last_name: last_name,
    address: address,
    birth_date: birth_date
  )
  users.last.image.attach(io: File.open(img_path), filename: img_name)
end


categories_list = [
    "default Category"
]

categories = []

categories_list.each do |name|
  categories << Category.create(
    name: name
  )
end


projects_list = [
    [
        true,
        false,
        false,
        "Project 1",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin egestas metus nec fringilla aliquam. Donec ultrices quis leo pretium fermentum. Duis rhoncus, diam ac elementum blandit, neque nisl sagittis ex, id iaculis turpis eros ultrices elit. Sed sodales dui ac arcu eleifend mattis. Donec tristique iaculis mollis. Curabitur dignissim felis semper orci semper scelerisque. Nullam et fermentum purus. Integer pharetra enim non dictum sodales. Integer in euismod sapien. Vestibulum laoreet leo vel nibh faucibus, interdum dictum nunc vehicula. Praesent in lacinia mauris. Suspendisse vulputate efficitur massa sit amet viverra. Suspendisse malesuada pharetra est, imperdiet rutrum eros aliquet ac. Duis magna mauris, sollicitudin nec dapibus sit amet, dignissim ac lacus. Duis cursus varius dolor, non vehicula enim finibus ac. Aenean eget lobortis diam. Aliquam nunc risus, lobortis non vehicula sit amet, laoreet eu neque. Maecenas elementum blandit risus in bibendum. Pellentesque sit amet velit lorem. Curabitur efficitur sodales purus, vitae facilisis erat lobortis vel. Cras tortor mi, molestie eu vulputate sed, dignissim et justo. Aenean quam arcu, facilisis faucibus varius id, bibendum id risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec eleifend pulvinar dui, quis porta velit eleifend vel. Sed hendrerit magna eget neque luctus fermentum eget in felis.",
        2000,
        30,
        "2018-06-04",
        categories[0],
        users[0],
        Rails.root+"db/seed_files/project.png",
        "project.png"
    ],
]

projects = []

projects_list.each do |approved, outstanding, deleted, title, description, ammount, days_to_go, delivery_date, category, user, picture_path, picture_name|
  projects << Project.create(
    approved: approved,
    outstanding: outstanding,
    deleted: deleted,
    title: title,
    description: description,
    ammount: ammount,
    days_to_go: days_to_go,
    delivery_date: delivery_date,
    category: category,
    user: user
  )
  projects.last.picture.attach(io: File.open(picture_path), filename: picture_name)
end


promises_list = [
    [
        200,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin egestas metus nec fringilla aliquam.",
        "2019-04-03",
        500,
        projects[0]
    ]
]

promises = []

promises_list.each do |price, description, release_date, quantity, project|
  promises << Promise.create(
    price: price,
    description: description,
    release_date: release_date,
    quantity: quantity,
    project: project
  )
end