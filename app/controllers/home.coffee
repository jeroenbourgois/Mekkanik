Spine = require 'spine'
Job = require 'models/job'

class Actions extends Spine.Controller
  events:
    'click #addJob': 'addJob'
    
  constructor: ->
    super

  addJob: (event) ->
    job = Job.create()
    @navigate '/job/' + job.id + '/edit'

  render: ->
    @html require 'views/home'
    
module.exports = Actions
