Spine = require('spine')
Job = require('models/job')

class Edit extends Spine.Controller
  className: 'job-edit'

  elements:
    'form': 'form'
    '#duration': 'duration'
    '#toggleTimer': 'timerBtn'
    '#resetTimer': 'resetTimerBtn'

  events:
    'click #submit': 'submit'
    'click #delete': 'destroy'
    'click #toggleTimer': 'toggleTimer'
    'click #resetTimer': 'resetTimer'

  constructor: ->
    super
    @init()

    @active @change

  init: ->
    # timer stuff
    @timerID = 0
    @timerTime = 0
    @timerPause = null
    @timerIsRunning = false
    @delay = 1000

  render: ->
    @html require('views/job-edit')(@item)

  change: (params) ->
    @item = Job.find(params.id)
    @init()
    @render()

  submit: (e) ->
    e.preventDefault()

    @item.fromForm(@form).save()
    @navigate '/jobs'

  destroy: (e) ->
    e.preventDefault()

    @item.destroy() if confirm('Wil je deze job verwijderen?')
    @navigate '/jobs'

  toggleTimer: (e) =>
    e.preventDefault()

    if not @timerIsRunning
      @startTimer()
      @timerBtn.text "Pause/resume"
    else
      @stopTimer()

  startTimer: =>
    @timerID = setInterval @updateTimer, @delay
    @timerIsRunning = true

    @resetTimerBtn.removeAttr('disabled')

  stopTimer: =>
    clearTimeout(@timerID)

    @updateTime()

    @timerIsRunning = false

  resetTimer: (e) =>
    e.preventDefault()

    @timerTime = -1
    @timerIsRunning = false
    @timerBtn.text "Start"

    @duration.val "00:00:00"

    @stopTimer()
    
  # updated every second, du-uh
  updateTimer: =>
    @updateTime()

  updateTime: ->
    # result in ms
    @timerTime++

    # individual parts
    @hours =  Math.round(@timerTime / (60 * 60))
    @minutes = Math.round((@timerTime % (60 * 60)) / 60)
    @seconds = Math.floor(((@timerTime % (60 * 60)) % 60))

    # padd with love (and 0)
    @hours = @padd(@hours)
    @minutes = @padd(@minutes)
    @seconds = @padd(@seconds)

    @duration.val(@hours + ":" + @minutes + ":" + @seconds)

  padd: (val) ->
    if val < 10 then return val = "0" + val else return val

class Show extends Spine.Controller
  className: 'job-show'

  constructor: ->
    super
    @active @change

  render: ->
    @html require('views/job-show')(@item)

  change: (params) ->
    @item = Job.find(params.id)
    @render()

  show: (job) ->
    @item = job
    @render()

class Row extends Spine.Controller
  className: 'job-row'

  tag: 'tr'

  constructor: ->
    super

  render: (job) ->
    @html require('views/job-row')(job)

class JobController extends Spine.Stack
  className: 'jobcontroller stack'
    
  controllers:
    show: Show
    row: Row
    edit: Edit
    
module.exports = JobController
