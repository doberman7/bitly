require 'uri'
require "net/http"

class Url < ActiveRecord::Base
	validates :long_url, presence: true
	validates :click_count, presence: true

	# This helper validates the attributes' values by testing whether they match a given regular expression, which is specified using the :with option.
	#NO ESTA SOPORTANDO ANALISIS DESDE EL INICIO CON /A PREGUINTAR A ABEL
	validates :long_url, format: { with: /(http|https)?:\/\//, message: "formato de URL incorrecto" }

	before_create :check_uri

	#Active Record Callback: antes de crear registro en la BD se usa methodo:
	before_create :create_short_url



	def create_short_url
		#prefijo del shot url
		shrt_url = ""
		3.times do
			#traerse el ascci entre numeros aleatorio
			#https://en.wikibooks.org/wiki/Ruby_Programming/ASCII
			str = []
			2.times do
				str<<(rand(65..90)).chr#letra aleatoria entre A - Z
				str<<(rand(97..122)).chr#letra aleatoria entre a - z
				shrt_url << str.sample
			end
		end
		#asignar el ary a atributo short_url del Url
		self.short_url = shrt_url
	end
	def add_click
		#sumar 1 al atributo click_count
		self.click_count = click_count + 1
		# ActiveRecord metod update: actualizar el atributo click_count
		self.update(click_count: click_count)
	end
	#AQUI
	def check_uri
		p "<"*50
		#Creates one of the URI’s subclasses instance from the string.
		url = URI::parse(self.long_url)
		p "HOST: #{url.host}"
		p "PORT: #{url.port}"
		p "PATH: #{url.path}"
		p "<"*50
		#Sends a GET request to the target and returns the HTTP response as a Net::HTTPResponse object. The target can either be specified as (uri), or as (host, path, port = 80); so:
		res = Net::HTTP.get_response(url)
		p "OBJETO NET con get response: #{res}"
		p "OBJETO NET code: #{res.code}" #IF 404 salr
		# p "OBJETO NET body: #{res.body}"
		p "MESAGE: #{res.message}"    # => 'OK'
		p "CLASS NAME #{res.class.name}" # => 'HTTPOK'
		p "<"*50
		#Sends a HEAD request to the path and returns the response as a Net::HTTPResponse object.
		# res = req.request_head(url.path)
		# p res
	end
end
