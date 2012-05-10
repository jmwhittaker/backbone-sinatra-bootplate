require 'rubygems'
require 'sinatra/base'
require 'sinatra/assetpack'
require 'sinatra/backbone'
require 'compass'
require 'sinatra/support/compasssupport'
require 'json'

Encoding.default_external = 'utf-8'  if defined?(::Encoding)

class App < Sinatra::Base
    set :root, File.dirname(__FILE__)

    register Sinatra::AssetPack
    register Sinatra::CompassSupport
    register Sinatra::JstPages
    serve_jst '/jst.js'

    #Compass Configuration
    csspath = File.join(App.root, 'css')
    c = Compass.configuration
    c.sass_dir              = csspath
    c.css_dir               = csspath

    assets do

        #Compression options
        js_compression :jsmin     #optional
        css_compression :sass      #optional

        # Where to serve the assets from
        serve '/js',        from: 'app/javascripts'
        serve '/css',       from: csspath
        serve '/images',    from: 'app/images'

        # JavaScripts
        my_js = [
                '/js/vendor/jQuery-1.7.2.min.js',
                '/js/vendor/hogan.min.js',
                '/js/vendor/underscore-1.3.3.js',
                '/js/vendor/backbone-0.9.2.js',
                '/jst.js'
            ]

        my_js << ['/js/app/app.js']
        js :app, '/js/app.js', my_js

        # Stylesheets
        my_css = [
            '/css/vendor/bootstrap.css',
            '/css/vendor/bootstrap_responsive.css'
        ]

        my_css << ['/css/app.css']
        css :application, '/css/application.css', my_css

    end

    #Routes
    get "/" do
        erb :index
    end

    get "/favicon.ico" do
        ""
    end

    #API Routes
    get "/components" do
        content_type :json
        file = File.read("stub_data/components.json")
    end

end