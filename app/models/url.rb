class Url < ActiveRecord::Base
	validates :long_url, presence: true
	validates :click_count, presence: true

	# This helper validates the attributes' values by testing whether they match a given regular expression, which is specified using the :with option.
	#NO ESTA SOPORTANDO ANALISIS DESDE EL INICIO CON /A PREGUINTAR A ABEL
	validates :long_url, format: { with: /(http|https)?:\/\//, message: "no tiene el forma" }

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

end
