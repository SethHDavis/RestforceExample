

client = Restforce.new(username: 'user',
                       password: 'pass',
                       security_token: 'token',
                       client_id: 'id',
                       client_secret: 'secret',
                       api_version: '43.0')


#query will get you a collection of objects that meet your parameters
contacts = client.query("SELECT ALL FROM Contact WHERE Id = 'id'")

#this can be used to determine specifics on certain users
contacts.first.Name
# => "Test Test"

#explain is the same as query, except it will return JSON instead
#this of course, requires the json gem
contacts_json = client.explain("SELECT ALL FROM Contact WHERE Id = 'id'")

contacts_json["1"]["name"]
# => "Test Test"

#find can be used to find a specific object using an ID
client.find('Contact', '001D000000INjVe')
# => #<Restforce::SObject Id="001D000000INjVe" Name="Jace Beleren" LastModifiedBy="005G0000002f8FHIAY" ... >


#create allows you to create a new object
client.create('Contact', Name: 'John Doe')
# => '0016000000MRatd'


#update will change an object
client.update('Contact', Id: '0016000000MRatd', Name: 'Name Name')
# => true

#however objects can also be changed the old-fasioned way
contacts.last.Name = "First Last"
contacts.last.save
# => true


#destroy will delete the chosen object
client.destroy('Contact', '0016000000MRatd')
# => true

contacts.last.destroy
# => true
