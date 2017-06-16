class Url < ActiveRecord::Base
	validates :long_url, presence: true

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
end
