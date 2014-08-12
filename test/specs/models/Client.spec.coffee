Spine = require('Spine')
Client = require('../../..//app/models/Client')

describe 'Client', ->
  Client = null
  
  beforeEach ->
    class Client extends Spine.Model
      @configure 'Client', 'bla'
  
  it 'can noop', ->
    expect(Client).toBeDefined()
    expect(Client.name).toBeDefined()
    expect(Client.bla).toBeDefined()
    
