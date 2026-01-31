# app/policies/admin_policy.rb
class AdminPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end

  def access?
    user.admin?
  end
end