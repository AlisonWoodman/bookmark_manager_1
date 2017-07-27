ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require_relative './models/user.rb'
require_relative 'data_mapper_setup.rb'

class Bookmark < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    # direct user to sign up
    # direct user to add links
    # then they can view /links which is populated
    # otherwise /links page will show 'no links added, please add a link'
  end

  get '/links' do
    @links = Link.all
    # @user = sessions[:user_id]
    # if @links.length == 0 ? erb :welcome : erb :links
    erb :links
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split(",").each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  helpers do
     def current_user
       @current_user ||= User.get(session[:user_id])
     end
  end
end
