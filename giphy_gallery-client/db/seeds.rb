# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# fetch('https://api.tenor.com/v1/trending?key=LIVDSRZULELA&anon_id=3a76e56901d740da9e59ffb22b988242')
# 	.then (resp => resp.json())

GIFS = [
    {
        url: "https://media.tenor.com/images/619b59dfeb6e16a4d21a8a9f23d4ffab/tenor.gif",
        title: "Love!",
        description: 'Len Kagamine GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/ce2e5a17182daadfacd66bac75c16d92/tenor.gif",
        title: "Dog hits cat",
        description: 'Golden Retriever Dog gif',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/406aad3a788eb79fd719b3f850eef398/tenor.gif",
        title: "Wow",
        description: 'Happy gif',
        like: 0
    },
    {
        url:  "https://media.tenor.com/images/51c1e262aca6c3511f992117c8dfc8ff/tenor.gif",
        title: "Head Tilt",
        description: 'Head Tilt ITold You GIF',
        like: 0
    },
    {
         url: "https://media.tenor.com/images/b3b60c4d4d9acad116ec2b4a6844249b/tenor.gif",
         title: "Thumbs up",
         description: 'opcorn Thumbs Up GIF',
         like: 0
     },         
     {
        url: "https://media.tenor.com/images/be43a40416eaaa7e212726e73878f056/tenor.gif",
        title: "Oooh",
        description: 'Pingu Pingu Oooh GIF',
        like: 0
    }, 
    {   
        url: "https://media.tenor.com/images/1e63aed6eb4a231b20fd6ffd07ff2e7b/tenor.gif",
        title: "Deal with it",
        description: 'Bran Deal With It GIF',
        like: 0
     },
    { 
        url: "https://media.tenor.com/images/21a766a78b56fd1a8cc3e7471bf7894c/tenor.gif", 
        title: "Happy",
        description: 'Happy Memorial Day Eagle GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/88c5c575a5224dc8121e12b2da6e4c26/tenor.gif", 
        title: "Wink",
        description: 'Wink You Know GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/96d57d2652e0d96dd74d0b8e001fd9dc/tenor.gif", 
        title: "Salute",
        description: 'Captain America Salute GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/e5927b040f65e2ae21a5d847813ed865/tenor.gif", 
        title: "Cute",
        description: 'Белый_медведь Cute GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/64715d3e5a4364c4117d3b1a9ae22e45/tenor.gif", 
        title: "Oh Yeah",
        description: 'Eyebrow Raise Aww Yeah GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/e7085851cd1705d4e526668fd86a3dd2/tenor.gif", 
        title: "Snuggly",
        description: 'Baby Otter Snuggly GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/83bbf04669db96bf52e556158c8f8bd4/tenor.gif", 
        title: "Whoa!!",
        description: 'Keanu Reeves Whoa GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/d84d751e4fc1bdefe213ef0f069eb424/tenor.gif", 
        title: "Jesus",
        description: 'Elizabeth Olsen Grimace GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/a16d00512c87ec14b112aa02d1088abc/tenor.gif", 
        title: "Dance",
        description: 'Spiderman Dance GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/ecb48277422d46ba734cf3e09381daac/tenor.gif", 
        title: "Fail",
        description: 'Fail Spiderman GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/8ef1c4cdd697e665c6b0284f57afed74/tenor.gif",
        title: "Oh No",
        description: 'Screaming Oh No GIF',
        like: 0
    },
    {
        url:  "https://media.tenor.com/images/ef1c2c3613f358b2f4ac236a2a06d867/tenor.gif", 
        title: "Nope",
        description: 'Nope Nah GIF',
        like: 0
    },
    {
        url: "https://media.tenor.com/images/be90af45acab2861aa203dd33da96829/tenor.gif",
        title: "Lol Lmao!",
        description: 'Lol Lmao GIF',
        like: 0
    }
]

GIFS.each do |gif|
    Gif.create(title: gif[:title], url: gif[:url], likes: 0, description: gif[:description])
end

#  number_of_gifs = Gif.all.size * 3


# number_of_gifs.times do
#     Comment.create(user_id: Gif.all.sample.id, content: "Faker::GreekPhilosophers.quote")
# end 
comment = [
    {user_id: 1,
    gif_id: 2,
    content: 'text'
    },
    {user_id: 1,
        gif_id: 2,
        content: 'text'
        }
]
Comment.create(comment)

 user = [
     {
    user_name: "Tunde",
     password: "Araoluwa"
     }
 ]
User.create(user)