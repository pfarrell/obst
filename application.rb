require 'sinatra' 
require 'haml'
require './obst'
require 'json'

gem 'emk-sinatra-url-for'
require 'sinatra/url_for'

get "/" do
  haml :index
end

post '/' do
  content_type :json
  stratagem = Stratagems.all.sample
  { :gem => stratagem.gem}.to_json
end

get '/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :style
end

def partial(template, *args)
  options = args.last.is_a?(Hash) ? args.pop : { }
  options.merge!(:layout => false)
  if collection = options.delete(:collection) then
    haml_concat(collection.inject([]) do |buffer, member|
    buffer << haml(template, options.merge(
      :layout => false,
      :locals => {template.to_sym => member}
      )
    )
    end.join("\n"))
  else
    haml_concat(haml(template, options))
  end
end
