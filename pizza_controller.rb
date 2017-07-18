require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

#INDEX
get '/pizzas' do
  @pizzas = Pizza.all
  erb(:index)
end

#NEW
get '/pizzas/new' do
  erb(:new)
end

#CREATE
post '/pizzas' do
  @new_order = Pizza.new(params)
  @new_order.save
  erb(:create)
end

#SHOW
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:details)
end

#EDIT
get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

#UPDATE
post '/pizzas/:id' do
  Pizza.new(params).update
  redirect to '/pizzas'
end

#DESTROY
post '/pizzas/:id/delete' do
  order = Pizza.new(params)
  order.delete()
  redirect to '/pizzas'
end
