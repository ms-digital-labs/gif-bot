require "sinatra/base"
require "json"

class GifBot < Sinatra::Base
  post "/" do
    content_type :json

    if params_present? && random_gif
      format_message(random_gif.original_image.url)
    else
      format_message("I couldn't find a gif :cry:")
    end
  end

  def params_present?
    params.has_key?("text") && params.has_key?("trigger_word")
  end

  def format_message(message)
    { text: message }.to_json
  end

  def random_gif
    @random_gif ||= Giphy.search(search_term).sample
  end

  def search_term
    params[:text].gsub(params[:trigger_word], "").strip
  end
end
