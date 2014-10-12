module Overrides

  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

    def assign_provider_attrs(user, auth_hash)
      user.assign_attributes({
        nickname: auth_hash['info']['nickname'],
        name:     auth_hash['info']['name'],
        image:    auth_hash['info']['image'],
        email:    auth_hash['info']['email'],
        oauth_access_token: auth_hash['credentials']['token'],
        oauth_access_token_secret: auth_hash['credentials']['secret'],
      })
    end

  end

end
