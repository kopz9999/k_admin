# CMS Form helpers

Check the following example to understand how to use the form

```erb

  <%= default_form_for(@item) do |f| %>

    <%= f.form_body do %>
      <%= f.default_field :name %>
      <%= f.default_control :description do %>
        <%= f.default_select :description, '<option value="1">Lisbon</option>'.html_safe %>
      <% end %>
    <% end %>

    <%= f.default_form_actions do %>
      <%= default_button 'Submit' %>
    <% end %>

  <% end %>


```

<ul>
  <li>
    <b> default_form_for </b>
    <ul>
      <li> Same as form_for but provides the right classes for KAdmin form </li>
    </ul>
  </li>
  <li>
    <b> form_body </b>
    <ul>
      <li> Container for form body, allocate fields here (inputs, pickers, labels, etc.) </li>
      <li>
        Please use the following helpers here:
        <ul>
          <li>
            <b> Full controls </b> These controls are build with default_control and another explicit control helper.
            <ul>
              <li>
                <b>default_field</b>
                <ul>
                  <li> Creates a field with label and text input </li>
                  <li> Args:
                    <ul>
                      <li> @field_name = name of the field </li>
                      <li> @options = hash of options </li>
                    </ul>
                  </li>
                </ul>            
              </li>
              <li>
                <b>default_textarea_field</b>
                <ul>
                  <li> Creates a field with label and textarea input </li>
                  <li> Args:
                    <ul>
                      <li> @field_name = name of the field </li>
                      <li> @options = hash of options </li>
                    </ul>
                  </li>
                </ul>            
              </li>
              <li>
                <b>default_select_field</b>
                <ul>
                  <li> Creates a field with label and select (dropdown) input </li>
                  <li> Args:
                    <ul>
                      <li> @field_name = name of the field </li>
                      <li> @option_tags = option tags for select helper </li>
                      <li> @options = hash of options </li>
                    </ul>
                  </li>
                </ul>            
              </li>
            </ul>
          </li>
          <li>
            <b> Explicit controls </b>
            <ul>

              <li>
                <b>default_control</b>
                <ul>
                  <li> Main container for a field, it provides you a label. The label is build with default_label helper </li>
                  <li> Args:
                    <ul>
                      <li> @field_name = name of the field </li>
                      <li> @column_width = boostrap columns </li>
                      <li> @content = block with content </li>
                    </ul>
                  </li>
                </ul>
              </li>

              <li>
                <b>default_label</b>
                <ul>
                  <li> Label for a field with right classes </li>
                  <li> Args:
                    <ul>
                      <li> @field_name = name of the field </li>
                      <li> @column_width = width of the column </li>
                    </ul>
                  </li>
                </ul>
              </li>

              <li>
                <b>default_textarea</b>
                <ul>
                  <li> Textarea for a field with right classes</li>
                  <li> Args:
                    <ul>
                      <li> @field_name = name of the field </li>
                    </ul>
                  </li>
                </ul>
              </li>

              <li>
                <b>default_select</b>
                <ul>
                  <li> Select(dropdown) for a field with right classes</li>
                  <li> Args:
                    <ul>
                      <li> @field_name = name of the field </li>
                      <li> @option_tags = option tags for select helper </li>
                      <li> @opts = hash of options </li>
                    </ul>
                  </li>
                </ul>
              </li>

            </ul>            
          </li>

        </ul>
      </li>
    </ul>    
  </li>
  <li>
    <b> default_form_actions </b>
    <ul>
      <li> Container for form actions, allocate buttons here </li>
    </ul>
  </li>

</ul>