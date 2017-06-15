enable :sessions

get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs.
  @urls = Url.all
  erb :index
end

post '/urls' do
  # crea una nueva Url
  @short_url = params[:new_url]
  p Url.create!(long_url: @short_url)
  redirect to '/:short_url'
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
  redirect to '/'
end
