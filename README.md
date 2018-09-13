# README

This is a standard rails app that will catch all requests fromthe user, request them server side and render them back to the user.  This process allows you to modify any response onthe way back to the user, using nokogiri.

 ## Setup
 Set env var
 ```hijack_site_root_url```
 .  This should end with a '/'.

example: in `config/application.yml`

 ```hijack_site_root_url: 'https://www.amazon.com/'```

 ```
 bundle install
 rails s
 ```

 You can now browse amazon.com at `http://localhost:3000`.

 You can change the page any way you like, for any request method, at `app/controllers/catch_all_controller.rb`.