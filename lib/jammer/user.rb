module Jammer
  class User
    def name
      git_user_attribute 'name'
    end

    def email
      git_user_attribute 'email'
    end

    def git_user_attribute(attribute)
      `git config --get user.#{attribute}`.strip
    end
  end
end
