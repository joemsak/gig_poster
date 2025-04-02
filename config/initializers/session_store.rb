Rails.application.config.session_store :cookie_store,
  key: "_bounty_hunter_session",
  domain: Rails.env.local? ? :all : "bounty-hunter-5sel.onrender.com",
  secure: Rails.env.production?,
  same_site: :strict
