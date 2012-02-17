Spine = require('spine')

class Job extends Spine.Model
  @configure 'Job', 'client'

  @extend Spine.Model.Local
  
module.exports = Job
