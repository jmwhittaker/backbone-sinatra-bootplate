##
# Models
##
class ComponentModel extends Backbone.Model

class ComponentCollection extends Backbone.Collection
    model: ComponentModel
    url: '/components'

    parse: (response) ->
        response.components

##
# Views
##
class ComponentItemView extends Backbone.View
    tagName: "li"
    template: JST['templates/componentview']

    initialize: ->
        @model.bind( 'change', @render)
        @model.view = this

    render: =>
        $(@el).html( @template(@model.toJSON()) )
        @

class IndexView extends Backbone.View
    template: JST['templates/index']

    render: =>
        $(@el).html @template()
        @

class HeaderView extends Backbone.View
    template: JST['templates/header']

    render: =>
        $(@el).html @template()
        @

class AboutView extends Backbone.View
    template: JST['templates/about']

    initialize: ->
        @collection.bind("reset", @addAll)
        @addAll

    addOne: (component) =>
        view = new ComponentItemView( {model: component})
        $("ul",@el).append( view.render().el )

    addAll: =>
        @collection.each(@addOne)

    render: =>
        $(@el).html @template()
        @

class DetailView extends Backbone.View
    template: JST['templates/detail']

    initialize: ->
        @model.bind("change", @render)

    render: =>
        $(@el).html @template(@model.toJSON())
        @


##
# Router / Controller
##
class AppRouter extends Backbone.Router

    componentList:  null
    requestedId:    null
    aboutView:      null

    routes:
        ""              : "index"
        "about"         : "about"
        "about/:item"   : "details"

    initialize: ->
        @componentList = new ComponentCollection()
        header = new HeaderView()
        console.log header
        $("#header").html( header.render().el )

    index: ->
        view = new IndexView()
        $("#content").html( view.render().el )

    about: ->
        @componentList.fetch()
        @aboutView = new AboutView({collection: @componentList})
        $("#content").html( @aboutView.render().el )

        if @requestedId
          @details @requestedId

    details: (item) ->
        if @aboutView
            item = new ComponentModel({name : item})
            detailView = new DetailView({model : item})
            $("#details").html( detailView.render().el )
        else
            @requestedId = item
            @about()

##
# DOM ready
##
$ ->
    app = new AppRouter()
    Backbone.history.start({pushstate: false})