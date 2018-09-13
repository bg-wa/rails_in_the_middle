class CatchAllController < ApplicationController
  def index
    case(request.request_method)
      when 'GET'
        intercept_get
      when 'POST'
        intercept_post
      when 'PUT'
        intercept_update
      when 'DELETE'
        intercept_destroy
      else
    end
  end

  def intercept_get
    url = "#{ENV['intercept_site_root_url']}#{params['path']}"
    response = HTTParty.get(url)
    nokogiri_response = Nokogiri::HTML(response)
    nokogiri_response.search('form').each do |form|
      form.attributes['action'].value = form.attributes['action'].value.gsub("#{ENV['intercept_site_root_url']}", "#{root_url}")
    end
    @html_response = nokogiri_response.to_html.html_safe
  end

  def intercept_post
    temp = params
  end

  def intercept_put
    temp = params
  end

  def intercept_delete
    temp = params
  end
end
