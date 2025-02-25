# VIEW HELPERS
helpers do
  def saved?(id)
    !!@stack["#{id}"]
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
    [/.*\/register/, /.*\/login/]
  end

  def from_bad_login_redirect?
    bad_urls_signed_in.any? do |bad_url|
      previous_url =~ bad_url
    end
  end
end