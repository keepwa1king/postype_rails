# frozen_string_literal: true

require "postype_rails/uploader"

class PostypeRails
  # Upload post in postype
  #
  # Example:
  #   >> PostypeRails.upload("cookie", "blog_id", "my post title", "<p>my post content</p>")
  #   => #<Net::HTTPOK 200 OK readbody=true>
  #
  # Arguments:
  #   cookie: (String)
  #   blog_id: (String)
  #   title: (String)
  #   content: (String)
  def self.upload(cookie, blog_id, title, content)
    uploader = Uploader.new(cookie, blog_id, title, content)
    uploader.upload
  end
end
