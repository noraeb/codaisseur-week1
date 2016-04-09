require 'sinatra'
require './toys_file.rb'

set :port, 4567

get '/' do
   "<h1>Toy Shop inventory</h1>
   <a href='toys'>[Enter]</a>"
end

get '/toys' do
   @toys = read_toys
   erb :'toys/index'
end

get '/toys/new' do
   erb :'toys/new'
end

get '/toys/search' do
  erb :'toys/search'
end


get '/toys/results' do
  #  search_toy = { name: params[:name]}
   @toys = read_toys.select { |toy| toy[:name] =~ /#{params[:name]}/i }
   erb :'toys/results'

   #
  #  toys = read_toys
  #  toys.each_with_index do |toy, i|
  #      if toy[:name] =~ /\b#{search_toy}/i
  #        @toy = toy
  #        @i = i
  #       return erb :"toys/show"
  #    end
  #  end
  #  redirect "/toys"
end

get '/toys/:i' do
   @i = params[:i].to_i
   toys = read_toys
   @toy = toys[@i]
   erb :'toys/show'
end

post '/toys' do
   new_toy = { name: params[:name], id: params[:id], quantity: params[:quantity] }

   toys = read_toys
   toys << new_toy
   write_toys( toys )

   i = toys.length - 1

   redirect "/toys/#{i}"
end

get '/toys/:i/edit' do
   @i = params[:i].to_i

   toys = read_toys
   @toys = toys[@i]

   erb :'toys/edit'
end

post '/toys/:i/update' do
   i = params[:i].to_i

   updated_toy = { name: params[:name], id: params[:id], quantity: params[:quantity] }

   toys = read_toys
   toys[i] = updated_toy
   write_toys( toys )

   redirect "/toys/#{i}"
end

get '/toys/:i/delete' do
   i = params[:i].to_i

   toys = read_toys
   toys.delete_at( i )
   write_toys( toys )

   redirect "/toys"
end
