This is a currently failing test of the tutorial Single Attribute In Place Editing for Rails and Turbo at https://nts.strzibny.name/single-attribute-in-place-editing-turbo/

This was made for Ruby Version 3.2.0 and Rails 7.0.4

Steps used:

git init saipert rails new saipert --css bootstrap --database=postgresql 
cd saipert 
rake db:setup 
git add . 
git commit -m "initial commit of new Rails 7.0.4.2, Ruby 3.2.0 app" 
rails generate scaffold User name:string 
rails db:migrate 
git add . 
git commit -m "generated scaffold files for User name:string"

##MADE ALL CHANGES FROM https://nts.strzibny.name/single-attribute-in-place-editing-turbo/ 

git commit -m "made changes from https://nts.strzibny.name/single-attribute-in-place-editing-turbo/ to enable in place editing of User name"

bin/dev produces this error:

Completed 500 Internal Server Error in 19ms (ActiveRecord: 4.3ms | Allocations: 10978) 13:52:26 web.1 | 13:52:26 web.1 | 13:52:26 web.1 | 13:52:26 web.1 | ActionView::Template::Error (undefined method `name' for nil:NilClass): 13:52:26 web.1 | 4: <%= user.name %> 13:52:26 web.1 | 5:

13:52:26 web.1 | 6: <%= turbo_frame_tag :user_name do %> 13:52:26 web.1 | 7: Name: <%= link_to @user.name, edit_name_user_path(@user) %> 13:52:26 web.1 | 8: <% end %> 13:52:26 web.1 | 9:
Showing /home/odyex/saipert/app/views/users/_user.html.erb where line #7 raised:

undefined method `name' for nil:NilClass Extracted source (around line #7): 5

6 <%= turbo_frame_tag :user_name do %> 7 Name: <%= link_to @user.name, edit_name_user_path(@user) %> 8 <% end %> 9
#DEBUGGING I EDIT _user.html.erb

changed line <%= link_to @user.name, edit_name_user_path(@user) %> TO: <%= link_to user.name, edit_name_user_path(user) %>

git add . odyex@DESKTOP-JASON:~/saipert$ 
git commit -m "Changed _user.html.erb LINE WITH: <%= link_to @user.name, edit_name_user_path(@user) %> TO: <%= link_to user.name, edit_name_user_path(user) %>"

bin/dev #now the error is

ActionController::UrlGenerationError in Users#edit_name Showing /home/odyex/saipert/app/views/users/edit_name.html.erb where line #2 raised:

No route matches {:action=>"show", :controller=>"users", :id=>nil}, missing required keys: [:id] Extracted source (around line #2): 1 2 3 4 5 6

<%= turbo_frame_tag :user_name do %> <%= form_with model: @user, url: user_path(@user) do |form| %>
