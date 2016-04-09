require 'sinatra'
require './contacts_file.rb'

set :port, 4567

get '/' do
   "<h1>Tacta Contact Manager</h1>"
end

get '/contacts' do
   @contacts = read_contacts
   erb :'contacts/index'
end

get '/contacts/new' do
   erb :'contacts/new'
end

get '/contacts/search' do
  erb :'contacts/search'
end

post '/contacts/search' do
  contacts = read_contacts
  search_term = {search: params[:search]}
  contacts.each_with_index do |contact, i|
    if contact[:name] =~ /\b#{search_term}/i
      @contact = contact
      @i = i
      return erb :"contacts/results"
      end
       redirect /"contacts"


  # if search_term = @contacts.select
  # @contacts[:name].select {|contacts|contacts[:name] == search_term}
  # p
end

# post '/contacts/search' do
#   # contacts = read_contacts
#   # search_term = {search: params[:search]}
#   # @contacts[:name].select {|contact| search_term}
#   erb :'contacts/search'
# end

get '/contacts/:i' do
   @i = params[:i].to_i
   contacts = read_contacts
   @contact = contacts[@i]
   erb :'contacts/show'
end

post '/contacts' do
   new_contact = { name: params[:name], phone: params[:phone], email: params[:email] }

   contacts = read_contacts
   contacts << new_contact
   write_contacts( contacts )

   i = contacts.length - 1

   redirect "/contacts/#{i}"
end

get '/contacts/:i/edit' do
   @i = params[:i].to_i

   contacts = read_contacts
   @contact = contacts[@i]

   erb :'contacts/edit'
end

post '/contacts/:i/update' do
   i = params[:i].to_i

   updated_contact = { name: params[:name], phone: params[:phone], email: params[:email] }

   contacts = read_contacts
   contacts[i] = updated_contact
   write_contacts( contacts )

   redirect "/contacts/#{i}"
end

get '/contacts/:i/delete' do
   i = params[:i].to_i

   contacts = read_contacts
   contacts.delete_at( i )
   write_contacts( contacts )

   redirect "/contacts"
end
