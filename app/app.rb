ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  set :session, true


  get '/' do
    redirect('/links')
  end

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.new(:url =>  params[:url], :title => params[:title])
    tag = Tag.create(:name => params[:name])
    LinkTag.create(:link => link, :tag => tag)
    redirect('/links')
  end

  post '/tags' do
    p params[:filter_name]

    @tag = Tag.all(name: params[:filter_name])
    erb(:'tags')
  end


  run! if app_file == $0

end
