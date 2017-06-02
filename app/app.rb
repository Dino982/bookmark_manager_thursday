ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative '../lib/link.rb'
require_relative '../lib/tag.rb'
require_relative 'datamapper_setup'



class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    puts "*#{link}*"
    puts "+#{tag}+"
    puts "******#{link.tags}********"
    redirect to('/links')

  end

end
