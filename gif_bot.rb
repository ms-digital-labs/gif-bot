require "sinatra/base"
require "json"

class GifBot < Sinatra::Base
  post "/" do
    search_term = params[:text].gsub(params[:trigger_word], "").strip
    content_type :json
    { text: search_term }.to_json
  end
end
