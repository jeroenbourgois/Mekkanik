define (require, exports, module) ->
  Backbone = require 'backbone'

  class Team extends Backbone.Model
    validate: (attrs) ->
      console.log(attrs.name)
      if attrs.name && attrs.name.length == 0
        return 'Name must be set'

      if attrs.members && attrs.members < 1
        return 'A team needs a least 1 member'

    defaults:
      id: 0
      name: 'Ploeg'

    initialize: () ->
      @bind 'error', (model, error) =>
        console.log(model.get('title') + " " + error)
