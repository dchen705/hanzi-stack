require 'json'

# VIEW HELPERS
helpers do
  def saved_in?(id, collection)
    collection.include?(id.to_s)
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

  def format_date(timestamp)
    "#{timestamp[5..9]}-#{timestamp[0..3]}"
  end
end

# ROUTE HELPERS
def normalize!(params)
  normalize_deck_id!(params)
  normalize_page_number!(params)
  parse_filters!(params)
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

def parse_filters!(params)
  if params['filters'].nil? || params['filters'].empty?
    params['filters'] = %w[hanzi pinyin meaning radical hsk2 hsk3].to_h do |key|
      [key, '']
    end
  else
    params['filters'] = JSON.parse(params['filters'])
  end
end
