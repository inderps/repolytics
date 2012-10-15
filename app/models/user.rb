class User
  include Her::Model
  uses_api $github

  def self.token code
    post_raw("https://github.com/login/oauth/access_token",
             :client_id => "30d150e7363fbec11080",
             :client_secret => "54f6bab8a6010416a3153911506995dd665559ef",
             :code => code,
             :state => "random123456"
    ) do |parsed_data|
      return parsed_data[:data][:access_token]
    end
  end
end