get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs.
     erb :index
end

post '/urls' do
  # crea una nueva Url
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
end
