require 'faraday'

# http = Net::HTTP.new('http://localhost:3000', '80')
# http.use_ssl = true
# http.get('/users/sign_in')
host = 'http://localhost:3000'
# puts Faraday.get(host).headers
USER_PERMISSIONS = {'1' => 'add, sub' }
USER_BALANCES = {'1' => 10000}
Faraday.delete(host + '/users/sign_out')
Faraday.post(host + '/users/sign_in') do |req|
   req.params['user'] = {'email': 'bank@test.com', 'password': '123456', 'password_confirmation': '123456'}
end
Faraday.get(host + '/chats/5')
