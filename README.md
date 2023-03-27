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

# My final post form partial is as follows. Here I add bulma specific classes to get Simple Form to play nice with the CSS framework. If you use Simple Form with Bootstrap or Foundation you likely need even less markup than this.

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

# The Post Controller
This is a Rails controller that facilitates the creation, editing, showing, updating, and deletion of posts on a blog. To create the Post Controller, you need to run rails g controller posts and add resources :posts and root: "posts#index" to the app/config/routes.rb file. 

# The controller includes the following CRUD actions:

index: Lists all posts in descending order of creation time.
new: Creates a new post object.
create: Saves a new post object to the database.
show: Displays a single post.
update: Updates an existing post object.
edit: Edits an existing post object.
destroy: Deletes an existing post object.
Additionally, the Post Controller includes a private post_params method that accepts and sanitizes post parameters.

# To interact with the Post model, which handles the data and interacts with the database:
 You need to run rails g model Post title:string content:text. This generates a Post table with two columns: title, which is a string, and content, which is text. After generating the Post model, you need to run rails db:migrate to migrate the new table into the database.

# To generate a Comments Controller, which allows the creation and deletion of comments associated with a post:
 Run rails g controller comments. The Comments Controller includes two actions: create, which creates a new comment, and destroy, which deletes a comment. To interact with the Comment model, which handles the comments data and interacts with the database, you need to run rails g model Comment name:string comment:text. After generating the Comment model, you need to run rails db:migrate to migrate the new table into the database.

# To set up relations between the Post and Comment models:
Add has_many :comments, dependent: :destroy to the Post model and belongs_to :post to the Comment model. To associate an ID between the models, run rails g migration AddPostIdToComments, navigate to app/db/migrate/XXXXXXXXXXXX_add_post_id_to_comments.rb, and add add_column :comments, :post_id, :integer to create a new column in the Comment table called post_id. Finally, run rails db:migrate to migrate the new migration.

The views are stored in app/views/ and include a layout file that serves as a "master" file.
 # The final application.html.erb file includes:
  Markup from the Bulma framework and navigational links to help users navigate the blog.
