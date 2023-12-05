# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

 product = Product.new(
  name:"desk", 
  price: 300, 
  image_url:"https://www.ikea.com/us/en/images/products/micke-desk-black-brown__0735981_pe740299_s5.jpg", 
  description:"perfect for studying"
  )

  product.save