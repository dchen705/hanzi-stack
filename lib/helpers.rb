# VIEW HELPERS
helpers do
  def saved_in?(id, collection)
    collection = yield(collection) if block_given?
    !!collection[id.to_s]
  end

  def signed_in?
    !!session[:username]
  end

  def logout
    session.delete(:username)
  end

  def previous_url
    request.referrer
  end

  def bad_urls_signed_in
    [%r{.*/register}, %r{.*/login}]
  end

  def from_bad_login_redirect?
    bad_urls_signed_in.any? do |bad_url|
      previous_url =~ bad_url
    end
  end
end

# ROUTE HELPERS
def normalize!(params)
  normalize_deck_id!(params)
  normalize_page_number!(params)
end

def normalize_deck_id!(params)
  id = params['deck-id']
  params['deck-id'] = nil if id.nil? || id.empty? || id.to_i.zero?
end

def normalize_page_number!(params)
  page_number = params['page']
  if page_number.nil? || page_number.to_i < 1
    params['page'] = 1
  else
    params['page'] = page_number.to_i
  end
end