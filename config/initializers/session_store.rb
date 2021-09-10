#config/initializers/session_store.rb
if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_plantly_key', domain: 'all'
  else
    
    Rails.application.config.session_store :cookie_store, key: '_planty_key', domain: 'all'
  end