module API
  module V1
    class Homes < Grape::API
      include API::V1::Defaults
      require 'net/http'
      require 'json'

      resource :homes do
        desc "Return all homes"
        get "index", root: :homes do
          {
            message: "test"
          }
        end

        get "/info", root: :homes do
          FAKE_URL = "https://jsonplaceholder.typicode.com/posts"
          uri = URI.parse FAKE_URL
          Net::HTTP.get(uri)
        end
      end
    end
  end
end
