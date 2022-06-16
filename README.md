# README

## Initial Setup

- Create a new Rails app in the appropriate folder: 
```
$ rails new blog_post_challenge_michael_denise -d postgresql -T
```

```
$ cd blog_post_challenge
```

Create a database: 
```
$ rails db:create
```
Add the dependencies for RSpec:
```
$ bundle add rspec-rails
$ rails generate rspec:install
```

Generate the model:
```
$ rails generate model Blog title:string content:text
$ rails db:migrate
```

Generate the controller:
```
$ rails generate controller Blog
```

Begin the rails server: 
```
$ rails server
```

In a browser navigate to: http://localhost:3000

# RESTful Routes

## Index

app > config > routes.rb

```
Rails.application.routes.draw do
  root 'blog#index'
end
```

app > controllers > >blog_controller.rb

```
class BlogController < ApplicationController
    
    def index
        @blogs = Blog.all
    end

end
```

app > views > blog > index.html.erb

```
<h1> Welcome to our blog </h1>

<ul>
<% @blogs.each do |blog| %>
<li>
<%= blog.title %>
</li>
<% end %>
</ul>
```

## Show

app > config > routes.rb

```
Rails.application.routes.draw do
  root 'blog#index'
  get 'show/:id' => 'blog#show', as: 'blog'
end
```

app > controllers > >blog_controller.rb

```
class BlogController < ApplicationController
 
    def index
        @blogs = Blog.all
    end

    def show
        @blog = Blog.find(params[:id])
    end
end
```

app > views > blog > index.html.erb

```
<h1> Welcome to our blog </h1>

<ul>
<% @blogs.each do |blog| %>
    <li>
        <%= link_to blog.title, blog_path(blog) %>
        
    </li>
<% end %>
</ul>
```

app > views > blog > show.html.erb

```
<h1> This blog: </h1>

<p>Title:<%=@blog.title%> </p>
<br>
<p><%=@blog.content%></p>
<br>
<br>
<p><%= link_to 'go back home', home_path%></p>
```

## New / Create

app > config > routes.rb

```
Rails.application.routes.draw do
  root 'blog#index', as: 'home'
  get 'blog/new' => 'blog#new', as: 'new_blog'
  get 'blog/:id' => 'blog#show', as: 'blog'
  post 'blog' => 'blog#create'
end
```

app > controllers > >blog_controller.rb

```
class BlogController < ApplicationController
 
    def index
        @blogs = Blog.all
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def new
       @blog = Blog.new
    end
        
end
```

app > views > blog > index.html.erb

```
<h1> Welcome to our blog </h1>

<ul>
<% @blogs.each do |blog| %>
    <li>
        <%= link_to blog.title, blog_path(blog) %>
        
    </li>
<% end %>
</ul>
<%= link_to 'create a new blog', new_blog_path %>
        
```

app > views > blog > new.html.erb

```
<h1> Write a new blog post </h1>

<%= form_with url:'/blog', local:true do |form| %>
<%= form.label :title %>
<%= form.text_field :title %>
<br>
<br>
<%= form.label :content %>
<%= form.text_field :content %>
<br>
<br>
<%= form.submit 'post blog' %>
<% end %>
<br>
<br>
<p><%= link_to 'Back Home', home_path %></p>
```