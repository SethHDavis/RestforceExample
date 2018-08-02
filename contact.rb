#contact model
class Contact < ActiveRecord::Base
  #initialize and authenticate
  def client
    Restforce.new(username: 'user',
      password: 'pass',
      security_token: 'token',
      client_id: 'id',
      client_secret: 'secret',
      api_version: '43.0')
    end
end
