window.KAdmin = window.KAdmin || {};

class KAdmin.App
  constructor: (opts = {}) ->
    @win = opts.win || $(window)
    @doc = opts.doc || $(document)
    this.init()
  init: ->
    _self = this
    @doc.ready -> _self.initDocument()
  initDocument: ->
    this.initContainers()
    this.handleHeight()
    this.initWindow()
  initWindow: ->
    _self = this
    @win.resize -> _self.handleHeight()
  handleHeight: ->
    this.setPageHeight() if @page_content.length > 0
    this.setSideBarHeight() if @sidebar.length > 0
  initContainers: ->
    @page_content = $('.page-content')
    @sidebar = $('#sidebar')
  setSideBarHeight: ->
    if @win.outerWidth() <= 767
      @sidebar.css( 'min-height', '100%' )
    else    
      sidebar_height = @win.outerHeight() - @sidebar.offset().top
      @sidebar.css( 'min-height', sidebar_height )
  setPageHeight: ->
    page_content_height = @win.outerHeight() - @page_content.offset().top - 50
    @page_content.css( 'min-height', page_content_height )
    #console.log page_content_height