# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_skedg_session',
  :secret      => 'b005b3985e12c9ebc2ebcf6a5e9195a2265962a6df763649144f1382889e3c9b4631a8ffe63ec746e58b9e4a4fd611a986bd5fb61b838fe47ec5a239bf6925cd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
