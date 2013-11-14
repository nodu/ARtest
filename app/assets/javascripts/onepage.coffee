$ ->
  Handlebars.registerHelper 'niceDate', (d) ->
    moment(d).calendar()

  showArticles = ->
    $.ajax
      url: '/api/articles'
      type: 'GET'
      data: 'json'
      success: (data) ->
        source = $("#articles-template").html()
        template = Handlebars.compile source
      
        $('#output').html template(data)
      error: (x,y,z) ->
        console.log x,y,z

  showArticle = (id) ->
    $.ajax
      url: '/api/articles/' + id
      type: 'GET'
      data: 'json'
      success: (data) ->
        source = $("#article-template").html()
        template = Handlebars.compile source
      
        $('#output').html template(data)
      error: (x,y,z) ->
        console.log x,y,z

  $('#output').on 'click', 'ul.article-links li', (e) ->
    showArticle $(this).data('id')

  $('#output').on 'click', 'p.articles-path', (e) ->
    showArticles()

  showArticles()