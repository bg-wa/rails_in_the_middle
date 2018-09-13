class CatchAllController < ApplicationController
  def index
    case(request.request_method)
      when 'GET'
        hijack_get
      when 'POST'
        hijack_post
      when 'PUT'
        hijack_update
      when 'DELETE'
        hijack_destroy
      else
    end
  end

  def hijack_get
    url = "#{ENV['hijack_site_root_url']}#{params['path']}"
    response = HTTParty.get(url)
    nokogiri_response = Nokogiri::HTML(response)
    nokogiri_response.search('form').each do |form|
      form.attributes['action'].value = form.attributes['action'].value.gsub("#{ENV['hijack_site_root_url']}", "#{root_url}")
    end
    @html_response = nokogiri_response.to_html.html_safe
  end

  def hijack_post
    temp = params
  end

  def hijack_put
    temp = params
  end

  def hijack_delete
    temp = params
  end
end
