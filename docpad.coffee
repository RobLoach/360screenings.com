module.exports =
  templateData:
    site:
      url: "http://360screenings.com"
      title: "360 Screenings"
      description: """
        360 Screenings provides a cinematic experience that audiences not only watch but also become a part of through live theatre installations.
        """

      # The website keywords (for SEO) separated by commas
      keywords: """
        Toronto, 30 Screenings, film, theatre
        """

      # The website's styles
      styles: [
        '/build.css'
      ]

      # The website's scripts
      scripts: [
        '/build.js'
      ]

      meta: ''

      services:
        googleAnalytics: 'UA-347108-6'

  collections:
    # Event listing, ordered by reverse basename (date).
    events: (database) ->
      database.findAllLive({layout: "event"}, [basename: -1])

  plugins:
    grunt:
      populateCollectionsBefore: ["static"]
      writeAfter: false
    thumbnails:
      imageMagick: true
      'default': 'zoomcrop'
    cleanurls:
      enabled: true
    ghpages:
      deployBranch: 'live'
    redirector:
        redirects:
            "October2013": "/exorcist"

  environments:
    development:
      templateData:
        site:
          title: "360 Screenings"
          scripts: [
            "/vendor/jquery/dist/jquery.js"
            "/vendor/bootstrap/dist/js/bootstrap.js"
            "/vendor/blueimp-gallery/js/blueimp-gallery.js"
            "/vendor/blueimp-gallery/js/jquery.blueimp-gallery.js"
            "/vendor/blueimp-bootstrap-image-gallery/js/bootstrap-image-gallery.js"
            "/vendor/vegas/dist/jquery.vegas.js"
            "/app.js"
          ]
          styles: [
            "/vendor/bootswatch/cyborg/bootstrap.css"
            "/vendor/blueimp-gallery/css/blueimp-gallery.css"
            "/vendor/blueimp-bootstrap-image-gallery/css/bootstrap-image-gallery.css"
            "/vendor/font-awesome/css/font-awesome.css"
            "/vendor/vegas/dist/jquery.vegas.css"
            "/app.css"
          ]
          services:
            googleAnalytics: 'UA-347108-6'
      plugins:
        cleanurls:
          enabled: true
        grunt:
          populateCollectionsBefore: false
          writeAfter: false
        thumbnails:
          targets:
            'default': 'zoomcrop'
