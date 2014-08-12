define (require, exports, module) ->
  Backbone = require 'backbone'
  $ = require 'jquery'
  utils = require 'cs!utils'

  AppRouter = require 'cs!router'

  $ ->
    utils.tpl.loadTemplates ['job', 'job_list', 'not_found', 'menu', 'register'], ->
      window.app = new AppRouter()
      window.app.navigate()

      Backbone.history.start {pushState: false}

      $('body a').bind 'click', (e) ->
        e.preventDefault()
        
        window.app.navigate $(this).attr('href'), true

        return false

  module.exports = {}
