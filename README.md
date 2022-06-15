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

**CHANGE BELOW THIS*+*
    
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
