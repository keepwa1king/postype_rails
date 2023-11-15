# PostypeRails

PostypeRails can help you automate when you post in your Postype Blog.

---

## Installation

    gem 'postype_rails', '~> 0.1.0'


## How To Find Blog ID & Cookie

### Postype Blog ID
- When you enter the screen where you write a new post, That screen's url show your blog_id (The yellow part of the picture)
<img width="300" alt="How To Find Your Postype Blog IDd" src="https://github.com/keepwa1king/postype_rails/assets/63589031/97ee6a20-a672-4113-91d0-040d051103fe">

### Postype Cookie
- I use Chrome, and I'll explain it to you based on that.
1. Open The DevTool And Let's Go to Network Tab
<img width="300" alt="Let's open Network Tab" src="https://github.com/keepwa1king/postype_rails/assets/63589031/d59fb7b7-890c-40c0-81d0-4de16206a350">

2. Then Select "Doc"
<img width="300" alt="Select Doc" src="https://github.com/keepwa1king/postype_rails/assets/63589031/ed57e617-b9de-4ad3-a48a-0e75433d4b37">

3. Without closing the DevTool, ReEnter The Screen where you write a new post
<img width="300" alt="Click This" src="https://github.com/keepwa1king/postype_rails/assets/63589031/4fa3206d-ce42-4c27-b47e-af03b0bdca73">

4. Click the First Request, You Can Find The Cookie In Request Headers (The yellow part of the picture)
<img width="300" alt="You Can Find Your Cookie" src="https://github.com/keepwa1king/postype_rails/assets/63589031/bcd58dca-1f74-460f-bb6b-ca1f923c3f31">


## Usage



```ruby

require 'postype_rails'

PostypeRails.upload("postype cookie", "blog id", "my post title", "<p>my post content</p>")
```
You should Pass Arguments.

### Arguments:
- cookie: (String)
- blog_id: (String)
- title: (String)
- content: (String) (**content should be html string**)
  

