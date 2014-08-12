define (require, exports, module) ->
  Backbone = require 'backbone'
  $ = require 'jquery'

  JobListView = require 'cs!controllers/job_list'
  JobDetailView = require 'cs!controllers/job_detail'
  GenericView = require 'cs!controllers/generic'
  RegisterView = require 'cs!controllers/register'

  Generic = require 'cs!models/generic'
  JobList = require 'cs!models/job_list'
  Job = require 'cs!models/job'

  class AppRouter extends Backbone.Router
    routes:
      '': 'list'
      'info': 'info'
      'register': 'register'

      'jobs': 'list'
      'job/:id': 'job_details'

      ':notfound': 'not_found'

    initialize: () ->
      @menu_data = new Generic
      @menu_data.set template: 'menu'

      @menu = new GenericView model: @menu_data, el: $('#wrapper nav')[0]
      @menu.render()

    list: ->
      @before () =>
        unless @job_list_view
          @job_list_view = new JobListView collection: @job_list, el: $('#content')

        @job_list_view.render()

    job_details: (id) ->
      @before () =>
        job = @job_list.get(id)

        job_detail_view = new JobDetailView model: job, el: $('#content')
        job_detail_view.render()

    register: () ->
      @before () =>
        job = new Job

        page_view = new RegisterView model: job, el: $('#content')
        page_view.render()

    info: () ->
      page_data = new Generic
      page_data.set template: 'info'

      page_view = new GenericView model: page_data, el: $('#content')
      page_view.render()

    not_found: () ->
      generic_page = new Generic
      generic_page.set template: 'not_found'

      generic_view = new GenericView model: generic_page, el: $('#content')
      generic_view.render()

    before: (callback) ->
      if @job_list
        callback() if callback
      else
        @job_list = new JobList
        @job_list.fetch { success: () =>
          callback() if callback
        }
