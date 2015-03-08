# CMS Assets

<b>load_default_fonts</b>
<ul>
  <li>
    Displays fonts for CMS
  </li>
</ul>

```erb
  
  <!-- Raw Output of grid_columns_for -->

  <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
  <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">

```

<b>load_default_stylesheets</b>
<ul>
  <li>
    Base Stylesheet for CMS
  </li>
</ul>

<b>load_default_javascripts</b>
<ul>
  <li>
    Base Javascript for CMS
  </li>
</ul>

<b>display_panel</b>
<ul>
  <li>
    Main panel for a page
  </li>
  <li>
    Args:
    <ul>
      <li>@content = Content for block </li>
    </ul>
  </li>

</ul>

```erb
  
  <!-- Raw Output of display_panel -->

  <div class="row mbl">
      <div class="col-lg-12">
          <div class="panel">
              <div class="panel-body">
                  <div class="row">
                    <div class="col-md-12">
                      <%= content %>
                    </div>                    
                  </div>
              </div>
          </div>
      </div>
  </div>

```

#Login Assets

<b>load_default_login_stylesheets</b>
<ul>
  <li>
    Base Stylesheet for Login CMS
  </li>
</ul>
