class ApplicationController < ActionController::API

  def encode_token(user_id)
    JWT.encode({user_id: user_id}, 'super_secret')
  end

  def token
    request.headers['Authorization']
  end

  def decode_token(token)
    begin
      JWT.decode(token, 'super_secret')[0]['user_id']
    rescue
      nil
    end
  end

  def curr_user(user_id)
    User.find_by(id: user_id)
  end
end
