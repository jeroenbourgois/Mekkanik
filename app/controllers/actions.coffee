Spine = require 'spine'
Job = require 'models/job'

class Actions extends Spine.Controller
  events:
    'click #addJob': 'addJob'
    
  constructor: ->
    super

  addJob: (event) ->
    job = new Job()
    # @navigate '/job/' + job.id + '/edit'
    @navigate '/job'

  render: ->
    @html require 'views/actions'
    
module.exports = Actions
