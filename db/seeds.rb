# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all

post_1 = Post.create!(
  title: "Gluten-free",
  content: "Taiyaki truffaut mumblecore, polaroid VHS palo santo craft beer brunch gluten-free kitsch. 
            Man bun freegan kombucha gluten-free irony dreamcatcher chambray. Actually hot chicken tote bag, 
            cloud bread kale chips keytar austin pickled cronut banjo kinfolk sriracha cray. Thundercats tousled jean shorts, 
            gentrify cloud bread fashion axe hot chicken live-edge post-ironic food truck mustache williamsburg 
            locavore mumblecore cardigan.",
)

post_2 = Post.create!(
  title: "Hexagon",
  content: "Ramps cornhole retro, marfa cardigan occupy 8-bit YOLO scenester. 
            Cray bespoke celiac, trust fund craft beer church-key four loko typewriter authentic yr cloud bread. 
            Cloud bread hexagon beard vape. Asymmetrical everyday carry farm-to-table edison bulb man bun kinfolk.",
)