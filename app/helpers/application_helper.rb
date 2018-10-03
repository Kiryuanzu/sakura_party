module ApplicationHelper

  def root_url_encode
    url = root_url
    escape_url = ERB::Util.url_encode(url)
    return escape_url
  end

end
