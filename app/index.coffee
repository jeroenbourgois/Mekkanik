require 'lib/setup'

Spine   = require 'spine'
$       = Spine.$

Actions = require 'controllers/actions'
JobEditController = require 'controllers/jobs.edit'

class App extends Spine.Controller
  className: "mekkanik app"

  elements:
    "#actions": "actions"
    "#job": "job"

  constructor: ->
    super

    @actionsController = new Actions({el : @actions})
    @jobEditController = new JobEditController({el: @job})

    @manager = new Spine.Manager @actionsController, @jobEditController
    @actionsController.active()

    @manager.bind 'change', (controller)->
      console.log 'stack change', this, arguments

    @routes
      "/" : (params) ->
        @home()
      "/job": (params) ->
        @jobEditController.active().render()
      "/job/:id/edit": (params) ->
        @jobEditController.active().render()

    Spine.Route.setup()

    @navigate "/"

  home: =>
    @actionsController.render()

module.exports = App
    
