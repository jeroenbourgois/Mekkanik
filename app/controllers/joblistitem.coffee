Spine = require('spine')

Job = require('models/job')

class Joblistitem extends Spine.Controller
  className: 'joblistitem'

  tag: 'tr'

  events:
    'click .edit': 'edit'

  constructor: ->
    super

    @active @change

  change: (params) =>
    @render()

  render: ->
    @html require('views/joblistitem')(@item)

  edit: (e) ->
    e.preventDefault()
    @navigate '/job/' + @item.id + '/edit'

module.exports = Joblistitem
