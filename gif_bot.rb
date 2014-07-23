require "sinatra/base"
require "json"

class GifBot < Sinatra::Base
  post "/" do
    content_type :json
    { text: "hello" }.to_json
  end
end
