#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base	
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do 
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:master]

	c = Client.new
	c.name = @username
	c.phone = @phone
	c.datestamp = @datetime
	c.barber = @barber
	c.save
	
	erb "Thanks, you maked an appointment"
end