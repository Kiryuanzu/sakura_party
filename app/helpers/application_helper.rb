module ApplicationHelper
  require "uri"

  def root_url_encode
    url = root_url
    escape_url = ERB::Util.url_encode(url)
    return escape_url
  end

 def text_url_to_link text

  URI.extract(text, ['https']).uniq.each do |url|
    sub_text = ""
    sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"

    text.gsub!(url, sub_text)
  end

  return text
end

end
