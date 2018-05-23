# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.email = "aa@aa.aa"
user.password = '123456789Ps'
user.name = "Aaaaa"
user.last_name = "Bbbbb Ccccc"
user.address = "Calle Falsa 123"
user.birth_date = "1992-05-03"
user.save

category = Category.new
category.name = "Default Category"
category.save

project1 = Project.new
project1.approved = true
project1.outstanding = false
project1.deleted = false
project1.title = "Project 1"
project1.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin egestas metus nec fringilla aliquam. Donec ultrices quis leo pretium fermentum. Duis rhoncus, diam ac elementum blandit, neque nisl sagittis ex, id iaculis turpis eros ultrices elit. Sed sodales dui ac arcu eleifend mattis. Donec tristique iaculis mollis. Curabitur dignissim felis semper orci semper scelerisque. Nullam et fermentum purus. Integer pharetra enim non dictum sodales. Integer in euismod sapien. Vestibulum laoreet leo vel nibh faucibus, interdum dictum nunc vehicula. Praesent in lacinia mauris. Suspendisse vulputate efficitur massa sit amet viverra. Suspendisse malesuada pharetra est, imperdiet rutrum eros aliquet ac. Duis magna mauris, sollicitudin nec dapibus sit amet, dignissim ac lacus. Duis cursus varius dolor, non vehicula enim finibus ac. Aenean eget lobortis diam. Aliquam nunc risus, lobortis non vehicula sit amet, laoreet eu neque. Maecenas elementum blandit risus in bibendum. Pellentesque sit amet velit lorem. Curabitur efficitur sodales purus, vitae facilisis erat lobortis vel. Cras tortor mi, molestie eu vulputate sed, dignissim et justo. Aenean quam arcu, facilisis faucibus varius id, bibendum id risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec eleifend pulvinar dui, quis porta velit eleifend vel. Sed hendrerit magna eget neque luctus fermentum eget in felis."
project1.ammount = 20000
project1.days_to_go = 30
project1.picture = 'https://www.cornerstone-hw.com/wp-content/uploads/2018/02/example-1prdct1.png'
project1.delivery_date = '2018-06-04'
project1.category = category
project1.user = user
project1.save

project2 = Project.new
project2.approved = true
project2.outstanding = false
project2.deleted = false
project2.title = "Project 2"
project2.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin egestas metus nec fringilla aliquam. Donec ultrices quis leo pretium fermentum. Duis rhoncus, diam ac elementum blandit, neque nisl sagittis ex, id iaculis turpis eros ultrices elit. Sed sodales dui ac arcu eleifend mattis. Donec tristique iaculis mollis. Curabitur dignissim felis semper orci semper scelerisque. Nullam et fermentum purus. Integer pharetra enim non dictum sodales. Integer in euismod sapien. Vestibulum laoreet leo vel nibh faucibus, interdum dictum nunc vehicula. Praesent in lacinia mauris. Suspendisse vulputate efficitur massa sit amet viverra. Suspendisse malesuada pharetra est, imperdiet rutrum eros aliquet ac. Duis magna mauris, sollicitudin nec dapibus sit amet, dignissim ac lacus. Duis cursus varius dolor, non vehicula enim finibus ac. Aenean eget lobortis diam. Aliquam nunc risus, lobortis non vehicula sit amet, laoreet eu neque. Maecenas elementum blandit risus in bibendum. Pellentesque sit amet velit lorem. Curabitur efficitur sodales purus, vitae facilisis erat lobortis vel. Cras tortor mi, molestie eu vulputate sed, dignissim et justo. Aenean quam arcu, facilisis faucibus varius id, bibendum id risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec eleifend pulvinar dui, quis porta velit eleifend vel. Sed hendrerit magna eget neque luctus fermentum eget in felis."
project2.ammount = 20000
project2.days_to_go = 30
project2.picture = 'https://www.cornerstone-hw.com/wp-content/uploads/2018/02/example-1prdct1.png'
project2.delivery_date = '2018-06-04'
project2.category = category
project2.user = user
project2.save

project3 = Project.new
project3.approved = true
project3.outstanding = false
project3.deleted = false
project3.title = "Project 3"
project3.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin egestas metus nec fringilla aliquam. Donec ultrices quis leo pretium fermentum. Duis rhoncus, diam ac elementum blandit, neque nisl sagittis ex, id iaculis turpis eros ultrices elit. Sed sodales dui ac arcu eleifend mattis. Donec tristique iaculis mollis. Curabitur dignissim felis semper orci semper scelerisque. Nullam et fermentum purus. Integer pharetra enim non dictum sodales. Integer in euismod sapien. Vestibulum laoreet leo vel nibh faucibus, interdum dictum nunc vehicula. Praesent in lacinia mauris. Suspendisse vulputate efficitur massa sit amet viverra. Suspendisse malesuada pharetra est, imperdiet rutrum eros aliquet ac. Duis magna mauris, sollicitudin nec dapibus sit amet, dignissim ac lacus. Duis cursus varius dolor, non vehicula enim finibus ac. Aenean eget lobortis diam. Aliquam nunc risus, lobortis non vehicula sit amet, laoreet eu neque. Maecenas elementum blandit risus in bibendum. Pellentesque sit amet velit lorem. Curabitur efficitur sodales purus, vitae facilisis erat lobortis vel. Cras tortor mi, molestie eu vulputate sed, dignissim et justo. Aenean quam arcu, facilisis faucibus varius id, bibendum id risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec eleifend pulvinar dui, quis porta velit eleifend vel. Sed hendrerit magna eget neque luctus fermentum eget in felis."
project3.ammount = 20000
project3.days_to_go = 30
project3.picture = 'https://www.cornerstone-hw.com/wp-content/uploads/2018/02/example-1prdct1.png'
project3.delivery_date = '2018-06-04'
project3.category = category
project3.user = user
project3.save

project4 = Project.new
project4.approved = true
project4.outstanding = false
project4.deleted = false
project4.title = "Project 4"
project4.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin egestas metus nec fringilla aliquam. Donec ultrices quis leo pretium fermentum. Duis rhoncus, diam ac elementum blandit, neque nisl sagittis ex, id iaculis turpis eros ultrices elit. Sed sodales dui ac arcu eleifend mattis. Donec tristique iaculis mollis. Curabitur dignissim felis semper orci semper scelerisque. Nullam et fermentum purus. Integer pharetra enim non dictum sodales. Integer in euismod sapien. Vestibulum laoreet leo vel nibh faucibus, interdum dictum nunc vehicula. Praesent in lacinia mauris. Suspendisse vulputate efficitur massa sit amet viverra. Suspendisse malesuada pharetra est, imperdiet rutrum eros aliquet ac. Duis magna mauris, sollicitudin nec dapibus sit amet, dignissim ac lacus. Duis cursus varius dolor, non vehicula enim finibus ac. Aenean eget lobortis diam. Aliquam nunc risus, lobortis non vehicula sit amet, laoreet eu neque. Maecenas elementum blandit risus in bibendum. Pellentesque sit amet velit lorem. Curabitur efficitur sodales purus, vitae facilisis erat lobortis vel. Cras tortor mi, molestie eu vulputate sed, dignissim et justo. Aenean quam arcu, facilisis faucibus varius id, bibendum id risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec eleifend pulvinar dui, quis porta velit eleifend vel. Sed hendrerit magna eget neque luctus fermentum eget in felis."
project4.ammount = 20000
project4.days_to_go = 30
project4.picture = 'https://www.cornerstone-hw.com/wp-content/uploads/2018/02/example-1prdct1.png'
project4.delivery_date = '2018-06-04'
project4.category = category
project4.user = user
project4.save

project5 = Project.new
project5.approved = true
project5.outstanding = false
project5.deleted = false
project5.title = "Project 5"
project5.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin egestas metus nec fringilla aliquam. Donec ultrices quis leo pretium fermentum. Duis rhoncus, diam ac elementum blandit, neque nisl sagittis ex, id iaculis turpis eros ultrices elit. Sed sodales dui ac arcu eleifend mattis. Donec tristique iaculis mollis. Curabitur dignissim felis semper orci semper scelerisque. Nullam et fermentum purus. Integer pharetra enim non dictum sodales. Integer in euismod sapien. Vestibulum laoreet leo vel nibh faucibus, interdum dictum nunc vehicula. Praesent in lacinia mauris. Suspendisse vulputate efficitur massa sit amet viverra. Suspendisse malesuada pharetra est, imperdiet rutrum eros aliquet ac. Duis magna mauris, sollicitudin nec dapibus sit amet, dignissim ac lacus. Duis cursus varius dolor, non vehicula enim finibus ac. Aenean eget lobortis diam. Aliquam nunc risus, lobortis non vehicula sit amet, laoreet eu neque. Maecenas elementum blandit risus in bibendum. Pellentesque sit amet velit lorem. Curabitur efficitur sodales purus, vitae facilisis erat lobortis vel. Cras tortor mi, molestie eu vulputate sed, dignissim et justo. Aenean quam arcu, facilisis faucibus varius id, bibendum id risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec eleifend pulvinar dui, quis porta velit eleifend vel. Sed hendrerit magna eget neque luctus fermentum eget in felis."
project5.ammount = 20000
project5.days_to_go = 30
project5.picture = 'https://www.cornerstone-hw.com/wp-content/uploads/2018/02/example-1prdct1.png'
project5.delivery_date = '2018-06-04'
project5.category = category
project5.user = user
project5.save

project6 = Project.new
project6.approved = true
project6.outstanding = false
project6.deleted = false
project6.title = "Project 6"
project6.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin egestas metus nec fringilla aliquam. Donec ultrices quis leo pretium fermentum. Duis rhoncus, diam ac elementum blandit, neque nisl sagittis ex, id iaculis turpis eros ultrices elit. Sed sodales dui ac arcu eleifend mattis. Donec tristique iaculis mollis. Curabitur dignissim felis semper orci semper scelerisque. Nullam et fermentum purus. Integer pharetra enim non dictum sodales. Integer in euismod sapien. Vestibulum laoreet leo vel nibh faucibus, interdum dictum nunc vehicula. Praesent in lacinia mauris. Suspendisse vulputate efficitur massa sit amet viverra. Suspendisse malesuada pharetra est, imperdiet rutrum eros aliquet ac. Duis magna mauris, sollicitudin nec dapibus sit amet, dignissim ac lacus. Duis cursus varius dolor, non vehicula enim finibus ac. Aenean eget lobortis diam. Aliquam nunc risus, lobortis non vehicula sit amet, laoreet eu neque. Maecenas elementum blandit risus in bibendum. Pellentesque sit amet velit lorem. Curabitur efficitur sodales purus, vitae facilisis erat lobortis vel. Cras tortor mi, molestie eu vulputate sed, dignissim et justo. Aenean quam arcu, facilisis faucibus varius id, bibendum id risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec eleifend pulvinar dui, quis porta velit eleifend vel. Sed hendrerit magna eget neque luctus fermentum eget in felis."
project6.ammount = 20000
project6.days_to_go = 30
project6.picture = 'https://www.cornerstone-hw.com/wp-content/uploads/2018/02/example-1prdct1.png'
project6.delivery_date = '2018-06-04'
project6.category = category
project6.user = user
project6.save


promise1 = Promise.new
promise1.price = 200
promise1.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin egestas metus nec fringilla aliquam."
promise1.release_date = "2019-04-03"
promise1.quantity = 500
promise1.project = project1
promise1.save
