#config/initializers/session_store.rb
if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_name-of-your-app', domain: 'https://plantly-app.netlify.app'
  else
    
    Rails.application.config.session_store :cookie_store, key: '_name-of-your-app', domain: 'all'
  end