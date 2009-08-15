# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_agenda_session',
  :secret      => '05ac1e68954fc26fdc4e2b53ce6c9791a37f147a87b76afd80f94aa886a0e5f7b32af629eb710e823b43b3f9a7f0921d70498c3da2242692f79929e540210218'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
