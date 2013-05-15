get '/' do
  @urls = Url.all

  erb :index
end

post '/' do
  @url = Url.create(:url => params[:url])
  redirect "/shortened_url#{@url.short_url}" 
end

get '/shortened_url/nate.ly/:short_url' do
  @short_url = "/nate.ly/" + params[:short_url]
  puts "short_url #{@short_url}"
  @url = Url.find_by_short_url(@short_url)
  erb :short_url
end