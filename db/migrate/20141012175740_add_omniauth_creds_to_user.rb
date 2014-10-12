class AddOmniauthCredsToUser < ActiveRecord::Migration
  def change
    add_column :users, :oauth_access_token, :text
    add_column :users, :oauth_access_token_secret, :text
  end
end
