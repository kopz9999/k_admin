You have the following optional content sections for the CMS: 

```erb

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
  <!-- Load your scripts after the Engine scripts (also available in login layout) -->
<% end %>

<% content_for :extra_stylesheets do %>
  <!-- Load your stylesheets after the Engine stylesheets (also available in login layout) -->
<% end %>

```

You have the following optional content sections in order to override the default content (also available in login layout): 

```erb

<% content_for(:custom_scripts) do %>
  <!-- 
    Load your scripts instead of the Engine scripts.
    For this case you may want to require the asset inside yout js: k_admin.js
  -->
<% end %>

<% content_for(:custom_stylesheets) do %>
  <!-- 
    Load your stylesheets instead of the Engine stylesheets.
    For this case you may want to require the asset inside yout css: k_admin.css
  -->
<% end %>

```
