enable :sessions

get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs.
  @urls = Url.all.reverse
  erb :index
end

post '/urls' do
  # crea una nueva Url
  Url.create!(long_url: params[:new_url])
  redirect to '/'
end

# e.g., /q6bda
get '/short_url/:short_url' do
  # redirige a la URL originals
  p "*" * 50
  p params
end
