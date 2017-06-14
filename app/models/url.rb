class Url < ActiveRecord::Base
  # Remember to create a migration!
	validates :long_url, presence: true
	# validates :short_url, presence: true

	before_create :create_short_url

	def create_short_url
		shrt_url = "https\://bitly/"
		3.times do
			#traerse el ascci entre numeros aleatorio
			#https://en.wikibooks.org/wiki/Ruby_Programming/ASCII
			str = []
			2.times do
				str<<(rand(65..90)).chr#mayuscula
				str<<(rand(97..122)).chr#minuscula
				shrt_url << str.sample
			end
		end
		self.short_url = shrt_url
	end

end
