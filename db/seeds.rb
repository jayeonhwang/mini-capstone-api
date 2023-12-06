# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

 product = Product.new(
  name:"wood box",
  price: 5,
  image_url:"https://target.scene7.com/is/image/Target/GUEST_9ea0aa47-8c0e-41d3-a3a2-a30e5665b9a8?wid=488&hei=488&fmt=pjpeg",
  description: "large size"
  )
  product.save