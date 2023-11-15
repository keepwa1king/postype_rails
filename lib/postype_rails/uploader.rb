require 'net/http'
require 'json'

class Uploader
  def initialize(cookie, blog_id, title, content)
    @cookie = cookie
    @blog_id = blog_id
    @title = title
    @content = content
  end

  def upload
    @post_id = posting
    saving
    publish
  end

  private

  def posting
    uri = URI('https://www.postype.com/api/post/id')
    params = {
      :blog_id => @blog_id,
    }
    uri.query = URI.encode_www_form(params)

    req = Net::HTTP::Get.new(uri)
    req['authority'] = 'www.postype.com'
    req['accept'] = 'application/json, text/javascript, */*; q=0.01'
    req['accept-language'] = 'ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7'
    req['cookie'] = @cookie
    req['sec-ch-ua'] = '"Google Chrome";v="119", "Chromium";v="119", "Not?A_Brand";v="24"'
    req['sec-ch-ua-mobile'] = '?1'
    req['sec-ch-ua-platform'] = '"Android"'
    req['sec-fetch-dest'] = 'empty'
    req['sec-fetch-mode'] = 'cors'
    req['sec-fetch-site'] = 'same-origin'
    req['user-agent'] = 'Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36'
    req['x-requested-with'] = 'XMLHttpRequest'

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    res = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(req)
    end

    JSON.parse(res.body)["data"]["post_id"]
  end

  def saving
    uri = URI('https://www.postype.com/api/post/save')
    params = {
      :auto => '0',
    }
    uri.query = URI.encode_www_form(params)

    req = Net::HTTP::Post.new(uri)
    req.content_type = 'application/x-www-form-urlencoded; charset=UTF-8'
    req['authority'] = 'www.postype.com'
    req['accept'] = 'application/json, text/javascript, */*; q=0.01'
    req['accept-language'] = 'ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7'
    req['cookie'] = @cookie
    req['origin'] = 'https://www.postype.com'
    req['sec-ch-ua'] = '"Google Chrome";v="119", "Chromium";v="119", "Not?A_Brand";v="24"'
    req['sec-ch-ua-mobile'] = '?1'
    req['sec-ch-ua-platform'] = '"Android"'
    req['sec-fetch-dest'] = 'empty'
    req['sec-fetch-mode'] = 'cors'
    req['sec-fetch-site'] = 'same-origin'
    req['user-agent'] = 'Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36'
    req['x-requested-with'] = 'XMLHttpRequest'

    req.set_form_data({
      'characters_limit' => '100000',
      'post_id' => @post_id,
      'content' => @content,
      'blog_id' => '1403904',
      'auto_save' => '1',
      'default_font' => 'font-sans-serif',
      'default_align' => 'text-left',
      'use_indent' => '',
      'use_p_margin' => '1',
      'type' => 'normal',
      'video-file-id' => '',
      'video-thumbnail-file-id' => '',
      'title' => @title,
      'sub_title' => ''
    })

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(req)
    end
  end
  
  def publish
    uri = URI('https://www.postype.com/api/post/publish')
    req = Net::HTTP::Post.new(uri)
    req.content_type = 'application/x-www-form-urlencoded; charset=UTF-8'
    req['authority'] = 'www.postype.com'
    req['accept'] = '*/*'
    req['accept-language'] = 'ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7'
    req['cookie'] = @cookie
    req['origin'] = 'https://www.postype.com'
    req['sec-ch-ua'] = '"Google Chrome";v="119", "Chromium";v="119", "Not?A_Brand";v="24"'
    req['sec-ch-ua-mobile'] = '?1'
    req['sec-ch-ua-platform'] = '"Android"'
    req['sec-fetch-dest'] = 'empty'
    req['sec-fetch-mode'] = 'cors'
    req['sec-fetch-site'] = 'same-origin'
    req['user-agent'] = 'Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36'
    req['x-requested-with'] = 'XMLHttpRequest'

    req.set_form_data({
      'post_id' => @post_id,
      'file_id' => '',
      'status' => 'published',
      'hidden_input' => '',
      'category_id' => '',
      'tags' => '',
      'public_option' => 'public',
      'point' => '1000',
      'free_blog_membership_plan_id' => '',
      'comment_type' => 'all_secret',
      'pubdate' => 'retain',
      'pubdate_time' => ''
    })

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(req)
    end
  end
end