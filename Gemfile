source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 3.0'
gem 'bcrypt', '~> 3.1.7'

group :production do
  gem 'thin'
end

group :development, :test do
  gem "letter_opener"
  gem 'puma'
  gem 'sqlite3'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
