require "sinatra/base"
require "json"

class GifBot < Sinatra::Base
  post "/" do
    return error("I need text and trigger_word parameters") unless params_present?
    search_term = params[:text].gsub(params[:trigger_word], "").strip
    gifs = Giphy.search(search_term)
    random_gif = gifs.sample

    content_type :json
    { text: random_gif.original_image.url }.to_json
  end

  def params_present?
    params.has_key?("text") && params.has_key?("trigger_word")
  end

  def error(error_message)
    { text: error_message }.to_json
  end
end
