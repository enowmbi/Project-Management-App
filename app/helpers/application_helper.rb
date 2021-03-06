module ApplicationHelper
  require 'net/http'
  require 'uri'

  DEFAULT_GRAVATAR = 'default_gravatar.jpeg'

  def task_status(task)
    task.complete? ? 'Complete': 'Incomplete'
  end

  def user_gravatar(user,size)
    email_hash = Digest::MD5.hexdigest(user[1].strip.downcase) 
    gravatar_url = "https://s.gravatar.com/avatar/#{email_hash}?s=#{size}" 
    gravatar_to_display = image_exists?(gravatar_url) ? gravatar_url : DEFAULT_GRAVATAR
    image_tag(gravatar_to_display, size: size, alt: user[0])
  end

  private

  def image_exists?(url)
    begin
      url = URI.parse(url)
      http = Net::HTTP.start(url.host, url.port)
      http.head(url.request_uri)['Content-Type'].start_with? 'image'
    rescue
      false
    end
  end

  def status_tag(boolean, options ={})
    options[:true_text] ||= ''
    options[:false_text] ||=''

    if boolean
      content_tag(:span, options[:true_text], :class=>'status true')
    else
      content_tag(:span,options[:false_text], :class =>'status false')
    end
  end

end
