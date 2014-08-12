require 'lib/setup'

<<<<<<< HEAD
Spine    = require('spine')
Contacts = require('controllers/contacts')
=======
Spine   = require 'spine'
$       = Spine.$

HomeController = require 'controllers/home'
JobController = require 'controllers/jobs'
JoblistController = require 'controllers/joblist'
Job = require 'models/job'
>>>>>>> 575aeb04b503d4244e35c14b74af2823fb1ea044

class App extends Spine.Controller
  className: "mekkanik app"

  elements:
    "#home": "home"
    "#job": "job"
    "#joblist": "joblist"

  events:
    'click #gotoJobs': 'gotoJobs'
    'click #gotoHome': 'gotoHome'
    'click .brand': 'gotoHome'

  constructor: ->
    super
    @contacts = new Contacts
    @append @contacts.active()
    
    Spine.Route.setup()

<<<<<<< HEAD
module.exports = App
=======
    # controllers
    @homeController = new HomeController({el : @home})
    @jobController = new JobController({el: @job})
    @joblistController = new JoblistController({el: @joblist})

    # manager, show one controller at a time
    @manager = new Spine.Manager @homeController, @jobController, @joblistController
    @manager.bind 'change', (controller)->
      console.log 'stack change', this, arguments

    # routes
    @routes
      "/" : (params) ->
        @gotoHome()
      "/jobs" : (params) ->
        @joblistController.active(params)
      "/job/:id": (params) ->
        @jobController.show.active(params)
      "/job/:id/edit": (params) ->
        @jobController.edit.active(params)

    Spine.Route.setup()

    @navigate "/"

  gotoHome: ->
    @homeController.active()
    @homeController.render()

  gotoJobs: =>
    @navigate '/jobs'

module.exports = App
    
>>>>>>> 575aeb04b503d4244e35c14b74af2823fb1ea044
