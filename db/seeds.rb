#p require_relative '../app/models/url.rb'#no fuciona para traerse el method create_short_url

	def create_short_url
		short_url = ""
		3.times do
			#traerse el ascci entre numeros aleatorio
			#https://en.wikibooks.org/wiki/Ruby_Programming/ASCII
			str = []
			2.times do
				str<<(rand(65..90)).chr#mayuscula
				str<<(rand(97..122)).chr#minuscula
				short_url << str.sample
			end
		end
		short_url
	end

#para que seed funcione necesario descomentar, ya que el require_relative no fuciona

10.times do
	Url.create!(long_url: "https\://github.com/stympy/faker", short_url: create_short_url, click_count: 0)
end
