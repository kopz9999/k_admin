module KAdmin
  module HelpersHelper
   
    def self.included(arg)
      ActionView::Helpers::FormBuilder.send(:include, HelpersHelper::FormBuilder)
    end

    def display_title(title, &block)
      content = block.nil? ? nil : capture(&block)
      render(:template =>"k_admin/helpers/_title.html.erb", :layout => nil , :locals => { :title => title, :content => content }).to_s
    end

    def display_menu_option( url, icon, title, is_active )
      render(:template =>"k_admin/helpers/_menu_option.html.erb", :layout => nil , :locals => { :url => url, :icon => icon, :title => title, :is_active => is_active }).to_s
    end

    def display_list_option( url, icon, title )
      icon = content_tag(:i, '', :class => "fa fa-#{icon}")
      anchor = content_tag(:a, "#{icon}#{title}".html_safe, :href => url )
      content_tag(:li, anchor)
    end

    def display_icon_link(text, link_parameter, icon = 'external-link', options={})
      icon = content_tag(:i, '', :class => "fa fa-#{icon}")
      data_opts = options[ :data ].nil? ? {} : options[ :data ]
      data_opts.merge!( placement: 'top', toggle: 'tooltip' )
      options.merge!( data: data_opts, title: text, class: 'icon-link' )
      link_to(icon.html_safe, link_parameter, options)
    end

    def display_title_link( url, icon, title )
      icon = content_tag(:i, '', :class => "fa fa-#{icon}")
      anchor = content_tag(:a, "#{icon}&nbsp;#{title}".html_safe, :href => url )
      content_tag(:li, "#{anchor}".html_safe)
    end

    def display_user_menu(url, avatar_url, user_name, &block)
      content = capture(&block)
      render(:template =>"k_admin/helpers/_user_menu.html.erb", :layout => nil , :locals => { url: url, avatar_url: avatar_url, user_name: user_name, :content => content }).to_s
    end    

    def load_default_fonts
      render(:template =>"k_admin/helpers/_fonts.html.erb", :layout => nil ).to_s
    end

    def load_default_stylesheets
      stylesheet_link_tag 'k_admin', media: 'all', 'data-turbolinks-track' => true
    end

    def load_default_javascripts
      javascript_include_tag 'k_admin', 'data-turbolinks-track' => true
    end

    def display_panel(&block)
      content = capture(&block)
      render(:template =>"k_admin/helpers/_panel.html.erb", :layout => nil , :locals => { :content => content }).to_s
    end

    def display_row_block(&block)
      content = capture(&block)
      col_content = content_tag(:div, content, :class => "col-md-12")
      content_tag(:div, col_content, :class => "row")
    end

    def grid_columns_for(column_width=1, column_offset=nil, &block)
      content = capture(&block)
      grid_columns_for_tag( content, column_width, column_offset )
    end

    def grid_columns_for_tag(content, column_width=1, column_offset=nil)
      offset_cls = column_offset.nil? ? "" : "col-md-offset-#{ column_offset }"
      content_tag(:div, content, :class => "#{offset_cls} col-md-#{ column_width }")
    end

    #Alerts helper

    def display_info_alert( text )
      content_tag(:div, text, :class => "alert alert-info") unless text.blank?
    end

    def display_success_alert( text )
      content_tag(:div, text, :class => "alert alert-success") unless text.blank?
    end

    def display_warning_alert( text )
      content_tag(:div, text, :class => "alert alert-warning") unless text.blank?
    end

    def display_danger_alert( text )
      content_tag(:div, text, :class => "alert alert-danger") unless text.blank?
    end

    #Controls Helper

    def control_group(options = {}, &block)
      content = capture(&block)
      control_group_tag(content, options)
    end

    def control_group_tag( content, options = {} )
      cls = options[:class]
      content_tag(:div, content, :class => "form-group #{ cls }")
    end

    def form_body_tag( content, options = {} )
      cls = options[:class]
      content_tag(:div, content, :class => "form-body pal #{ cls }")        
    end

    def form_actions_tag( content, options = {} )
      cls = options[:class]
      content_tag(:div, content, :class => "form-actions pal #{ cls }")        
    end

    def default_button( text )
      button_tag text, :class => 'btn btn-primary' 
    end

    def default_form_for(record, options = {}, &block)
      options.merge!( html: { :class => 'form-horizontal' } )
      form_for(record, options, &block )
    end

    def help_note_tag( text )
      content_tag(:small, text, :class => "help-block")        
    end

    module FormBuilder

      def form_body(options = {}, &block)
        content = @template.capture(&block)
        @template.form_body_tag(content, options)
      end

      def form_actions(options = {}, &block)
        content = @template.capture(&block)
        @template.form_actions_tag(content, options)
      end

      def default_form_actions(column_width = 2, column_offset = 10, &block)
        content = @template.capture(&block)
        grid_cols = @template.grid_columns_for_tag( content, column_width, column_offset )
        control_group = @template.control_group_tag( grid_cols, :class => 'mbn' )
        @template.form_actions_tag control_group
      end

      def default_field(method, options={})
        default_control(method, 9) do
          default_text_field(method)
        end
      end

      def default_textarea_field(method, options={})
        default_control(method, 9) do
          default_textarea(method)
        end
      end

      def default_select_field(method, option_tags, opts = {}, options={})
        default_control(method, 9) do
          default_select(method, option_tags, opts)
        end
      end

      def default_control( method, column_width = 9, &block )
        label = default_label(method)
        current_errs = @object.errors[method]
        if current_errs.any?
          err_tags = ""
          control = @template.capture( &block )
          
          current_errs.each do |err|
            err_tags += @template.help_note_tag err
          end

          control_desc_tag = @template.content_tag(:div, err_tags.html_safe)
          control_container = @template.grid_columns_for_tag( "#{ control } #{ control_desc_tag }".html_safe, column_width )

          tag = "#{ label } #{ control_container }".html_safe
          return @template.control_group_tag tag, :class => 'has-error'
        else
          control = @template.capture( &block )
          control_container = @template.grid_columns_for_tag( control, column_width )

          tag = "#{ label } #{ control_container }".html_safe
          return @template.control_group_tag tag
        end
      end

      def default_label(method, column_width=2)
        label(method, :class => "col-md-#{column_width} control-label") 
      end

      def default_textarea(method)
        text_area method, :class => 'form-control'
      end

      def default_select(method, option_tags, opts = {})
        select method, option_tags, opts, :class => 'form-control'
      end

      def default_text_field( method )
        text_field( method, :class => "form-control" )
      end

=begin

  CODE TO REMOVE
  #Default field previous functionality:

        label = default_label(method)
        current_errs = @object.errors[method]
        if current_errs.any?
          err_tags = ""
          input = default_input(method) do
            current_errs.each do |err|
              err_tags += @template.help_note_tag err
            end
            err_tags.html_safe
          end
          tag = "#{ label } #{ input }".html_safe
          return @template.control_group_tag tag, :class => 'has-error'
        else
          input = default_input(method)
          tag = "#{ label } #{ input }".html_safe
          return @template.control_group_tag tag
        end

      def default_input(method, column_width=9, &block)
        input_content = text_field( method, :class => "form-control" )
        if block.nil?
          tag = input_content
        else
          input_desc = @template.capture &block
          input_desc_tag = @template.content_tag(:div, input_desc)
          tag = "#{input_content} #{input_desc_tag}".html_safe
        end
        @template.grid_columns_for_tag( tag, column_width )
      end
=end

    end

    #ActionView::Helpers::FormHelper.send(:include, HelpersHelper::FormHelper)


  end
end
