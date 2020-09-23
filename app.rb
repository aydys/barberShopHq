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
	@date_time = params[:datetime]
	@master = params[:master]

	erb "Thanks, you maked an appointment"
end