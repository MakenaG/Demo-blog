# README

# Kicking things off with a blog
To easily demonstrate the principles of working with Ruby on Rails I chose to build a basic blog. Each blog post will be able to be created, read, edited, and deleted. There will also be comments associated with each individual blog post. Comments will be able to be created and deleted.



# Gems used in the project
Better Errors - Easier on the eyes when it comes to errors.

Bulma - Most of the time I would roll my own CSS or just use bits of a framework. I'm a big fan of bulma so we will be using it a lot throughout this series.

Guard - This gem is useful for live reloading our scss, js, css, and erb files, although it's capable of much more! Guard is required for the Guard LiveReload gem to work

Add the following within the development space in the Gemfile. Make sure to run bundle and restart your server (covered in the video).

group :development do
  # Guard is a command line tool to easily handle events on file system modifications.
  gem 'guard', '~> 2.14', '>= 2.14.1'
end
Guard LiveReload - This gem depends on the Guard gem. I use this to automatically reload the browser when Guard senses changes within the code base.

Download the livereload browser extension for your browser.
Add the following within the development space of the Gemfile. Make sure to run bundle and restart your server.
group :development do
  # reload the browser after changes to assets/helpers/tests 
  gem 'guard-livereload', '~> 2.5', '>= 2.5.2', require: false
end
Run guard init livereload

Be sure to comment out the following block in the `Guardfile if it gets generated for your project.

# comment this whole block out as we won't be making use if minitest
# guard :minitest do
# ....
# end
Restart your server once more for good measure. Run:

bundle exec guard
to start the "watching" process within your project directory. We use bundle exec as a prefix here so guard has access to all of our dependences in the project. ​

Make sure your browser extension is active when navigating to your app. If your console reads back something similar to the following, then you are in good shape.

00:00:00 - INFO - LiveReload is waiting for a browser to connect.
00:00:00 - INFO - Guard is now watching at '/path/to/your/project/'
[1] guard(main)> 00:00:00 - INFO - Browser connected.
Simple Form - For simpler forms!

# Our final post form partial is as follows. Here I add bulma specific classes to get Simple Form to play nice with the CSS framework. If you use Simple Form with Bootstrap or Foundation you likely need even less markup than this.

<div class="section">
<%= simple_form_for @post do |f| %>
  <div class="field">
    <div class="control">
      <%= f.input :title, input_html: { class: 'input' }, wrapper: false, label_html: { class: 'label' } %>
    </div>
  </div>

  <div class="field">
    <div class="control">
      <%= f.input :content, input_html: { class: 'textarea' }, wrapper: false, label_html: { class: 'label' }  %>
    </div>
  </div>
  <%= f.button :submit, 'Create new post', class: "button is-primary" %>
<% end %>
</div>
