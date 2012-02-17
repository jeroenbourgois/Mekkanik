Spine = require('spine')
Job = require('models/job')

class JobEditController extends Spine.Controller
  className: 'job-edit'

  constructor: ->
    super
    @log 'JobEdit'
    @active @change

  render: ->
    @html require('views/job')

  change: ->
    @log 'job edit change'

module.exports = JobEditController
