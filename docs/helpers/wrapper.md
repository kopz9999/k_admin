
# CMS Wrapper

<b>display_title</b>
<ul>
  <li>
    Displays title for page, it should be used inside the page_title content section.
  </li>
  <li>
    Args:
    <ul>
      <li>@title = html </li>
      <li>@content = block with content </li>
    </ul>
  </li>
</ul>

```erb

  <!-- Usage Example -->
  <% content_for :page_title do %>
    <%= display_title "Items" do %>
      <%= display_title_link new_item_path, "plus", "New Item" %>
    <% end %>
  <% end %>
  
  <!-- Raw Output of display_title -->

  <div class="page-header pull-left">
    <div class="page-title"><%= title %></div>
  </div>

  <!-- If content provided -->
  <ol class="breadcrumb page-breadcrumb pull-right">
    <%= content %>
  </ol>

```

<b>display_menu_option</b>
<ul>
  <li>
    Display an option for the menu
  </li>
  <li>
    Args:
    <ul>
      <li>@url = url of the option </li>
      <li>@icon = icon of the option </li>
      <li>@title = title of the option menu </li>
      <li>@is_active = the option is active </li>
    </ul>
  </li>
</ul>

```erb

  <!-- Usage Example -->
  <% content_for :application_menu do %>
    <%= display_menu_option '#', 'home', 'Home', false %>
    <%= display_menu_option '#', 'ticket', 'Tickets', true %>
  <% end %>
  
  <!-- Raw Output of display_menu_option -->

  <li class="<%= is_active ? 'active' : '' %>">
    <%= link_to(url) do %>
      <i class="fa fa-<%= icon %> fa-fw">
        <div class="icon-bg bg-orange"></div>
      </i>
      <span class="menu-title"><%= title %></span>
    <% end %>
  </li>

```

<b>display_user_menu</b>
<ul>
  <li>
    Display the user menu
  </li>
  <li>
    Args:
    <ul>
      <li>@url = url for view user profile </li>
      <li>@avatar_url = user avatar url </li>
      <li>@user_name = name of the user </li>
      <li>@content = block with content </li>
    </ul>
  </li>
</ul>

```erb

  <!-- Usage Example -->
  <% content_for :top_right_options do %>
    
    <%= display_user_menu( '#', "k_admin/avatar-user.png", "John Doe" ) do %>
      <%= display_list_option '#', 'user', 'My Profile' %>
    <% end %>
    
  <% end %>
  
  <!-- Raw Output of display_user_menu -->
  <li class="dropdown topbar-user">
    <a data-hover="dropdown" href="<%= url %>" class="dropdown-toggle">
      <%= image_tag avatar_url %>
      <span class="hidden-xs"><%= user_name %></span>&nbsp;
      <span class="caret"></span>
    </a>
    <ul class="dropdown-menu dropdown-user pull-right">
      <%= content %>
    </ul>
  </li>

```

<b>display_list_option</b>
<ul>
  <li>
    Displays an option for the user menu
  </li>
  <li>
    Args:
    <ul>
      <li>@url = url of the option </li>
      <li>@icon = icon of the option </li>
      <li>@title = name of the option </li>
    </ul>
  </li>
</ul>

```erb

  <!-- Usage Example -->
  <% content_for :top_right_options do %>
    
    <%= display_user_menu( '#', "k_admin/avatar-user.png", "John Doe" ) do %>
      <%= display_list_option '#', 'user', 'My Profile' %>
    <% end %>
    
  <% end %>
  
  <!-- Raw Output of display_list_option -->
  <li><a href="<%= url %>"><i class="fa fa-<%= icon %>"></i><%= title %></a></li>

```

<b>display_row_block</b>
<ul>
  <li>
    Displays a block for content
  </li>
  <li>
    Args:
    <ul>
      <li>@content = block with content </li>
    </ul>
  </li>
</ul>

```erb

  <!-- Usage Example -->

  <%= display_row_block do %>
    Your content
  <% end %>
  
  <!-- Raw Output of display_icon_link -->

  <div class="row">
    <div class="col-md-12">
      <%=  content %>
    </div>
  </div>

```

<b>grid_columns_for</b>
<ul>
  <li>
    Displays a block for content
  </li>
  <li>
    Args:
    <ul>
      <li>@column_width = Width of column </li>
      <li>@column_offset (optional) = columns offset </li>
      <li>@content = Content for block </li>
    </ul>
  </li>
</ul>

```erb

  <!-- Usage Example -->

  <%= grid_columns_for 2, 3 do %>
    Your content
  <% end %>
  
  <!-- Raw Output of grid_columns_for -->

  <div class="col-md-2 col-md-offset-3">
    <%=  content %>
  </div>

```

<b>default_button</b>
<ul>
  <li>
    Displays a button
  </li>
  <li>
    Args:
    <ul>
      <li>@text = Text for a button </li>
    </ul>
  </li>
</ul>

# CMS Login helpers

<b>login_container</b>
<ul>
  <li>
    Container for login box
  </li>
  <li>
    Args:
    <ul>
      <li>@content = Content for block </li>
    </ul>
  </li>

</ul>