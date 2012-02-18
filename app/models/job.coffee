Spine = require('spine')

class Job extends Spine.Model
  @configure 'Job', 'client', 'carID', 'description', 'date', 'duration'

  @extend Spine.Model.Local
  
module.exports = Job
