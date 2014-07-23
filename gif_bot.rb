require "sinatra/base"
require "json"

class GifBot < Sinatra::Base
  post "/" do
    search_term = params[:text].gsub(params[:trigger_word], "").strip
    gifs = Giphy.search(search_term)
    random_gif = gifs.sample

    content_type :json
    { text: random_gif.original_image.url }.to_json
  end
end
