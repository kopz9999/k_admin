#KAdmin

Work in progress ...
<br/>
This Rails Engine provides you the tools required to build a CMS with the Look and feel of: http://themifycloud.com/demos/templates/KAdmin/KAdmin-Dark/Tables.html
<br/>
This project uses the extended license for KAdmin http://themifycloud.com/
<br/>
In order to provide the look and feel wrapper, you must call the following layout "k_admin/application":

```ruby

class ItemsController < ApplicationController

  layout "k_admin/application"

end

```

When you load the layout, you have several content sections:

```html_ruby

<% content_for :extra_stylesheets do %>
  <!-- Load your stylesheets after the Engine stylesheets -->
<% end %>

<% content_for :app_logo do %>
  <!-- Application Logo, top left (span or img) -->
<% end %>

<% content_for :top_right_options do %>
  <!-- Top right options, put notifications or user options here -->
<% end %>

<% content_for :application_menu do %>
  <!-- Displays left menu options for the application  -->
<% end %>

<% content_for :extra_content do %>
  <!-- Content before the main page -->
<% end %>

<% content_for :page_title do %>
  <!-- title of the main page -->
<% end %>

<% content_for :app_footer do %>
  <!-- Displays the footer -->
<% end %>

<% content_for :extra_scripts do %>
  <!-- Load your scripts after the Engine scripts -->
<% end %>

```

You have the following optional content sections in order to override the default content: 

```html_ruby

<% content_for(:custom_scripts) do %>
  <!-- 
    Load your scripts instead of the Engine scripts.
    For this case you may want to require the asset: k_admin.js
  -->
<% end %>

<% content_for(:custom_stylesheets) do %>
  <!-- 
    Load your stylesheets instead of the Engine stylesheets.
    For this case you may want to require the asset: k_admin.css
  -->
<% end %>

```


