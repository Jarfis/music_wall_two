require_relative "../config/environment"

Track.create(title: "title 1", author: "author 1", url: "url.com", user_id: 1)
Track.create(title: "title 2", author: "author 1", url: "url.com", user_id: 2)
Track.create(title: "title 3", author: "author 2", url: "url.com", user_id: 3)
Track.create(title: "title 4", author: "author 2", url: "url.com", user_id: 4)

User.create(username: "bobbers", fname:"bob", lname: "bob", password: "bob")
User.create(username: "jimjim", fname: "jim", lname: "jim", password: "jim")
User.create(username: "jeffinator", fname: "jim", lname: "jim", password: "jim")
User.create(username: "steveotron", fname: "steve", lname: "steve", password: "steve")