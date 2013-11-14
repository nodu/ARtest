# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Article.destroy_all

articles = Article.create([
  {
    title: "My First Article",
    body: "Here is the corpus. Delictum.",
    published: false
  },
  {
    title: "My Second and BETTER Article",
    body: "Lorem ipsum dolor sit amet.",
    published: true
  }
  ])

comments = Comment.create([
  {
    author: "Matt",
    body: "This is a comment",
    article: articles[0]
  },
  {
    author: "Lauren",
    body: "This is an article but short...",
    article: articles[0]
  },
  {
    author: "Gob",
    body: "Yes, it is borning.",
    article: articles[1]
  }


  ])