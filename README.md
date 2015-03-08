#KAdmin

This Rails Engine provides you the tools required to build a CMS with the Look and feel of: http://themifycloud.com/demos/templates/KAdmin/KAdmin-Dark/Tables.html
<br/>
This project uses the extended license for KAdmin http://themifycloud.com/
<br/>
In order to provide the look and feel wrapper for CMS, you must specify the layout and include the helpers:

```ruby

class ItemsController < ApplicationController

  layout "k_admin/application"
  helper KAdmin::HelpersHelper  

end

```

The Engine also provides a page layout for login:

```ruby

class LoginController < ApplicationController

  layout 'k_admin/login'

end

```

When you load the layout, you have several content sections:

[Wrapper](docs/layouts/wrapper.md)

The following helpers are available:

[Wrapper](docs/helpers/wrapper.md)
<br/>
[Assets](docs/helpers/assets.md)
<br/>
[Form](docs/helpers/form.md)
<br/>
[Alerts](docs/helpers/alerts.md)


