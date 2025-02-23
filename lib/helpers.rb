# VIEW HELPERS
helpers do
  def saved?(id)
    !!@stack["#{id}"]
  end
end