# app/services/users/create_user.rb
module Users
  class CreateUser
    def initialize(params)
      @params = params
    end

    def call
      user = User.new(@params)
      user.save!
      user
    end
  end
end
