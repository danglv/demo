module API
  module V1
    class Homes < Grape::API
      include API::V1::Defaults
      require 'net/http'
      require 'json'

      resource :homes do
        desc "MockAPI return message"
        get "index", root: :homes do
          {
            message: "test"
          }
        end

        desc "MockAPI get call net::http"
        get "/info", root: :homes do
          FAKE_URL = "https://jsonplaceholder.typicode.com/posts"
          uri = URI.parse FAKE_URL
          Net::HTTP.get(uri)
        end

        desc "MockAPI post with params"
        params do
          requires :id, type: Integer, desc: "Mock ID require"
          requires :token, type: String, desc: "Mock token require"
          optional :message, type: String, desc: "Mock message option"
        end
        post "/mock_post" do
          message = {
            id: "you post id = #{permitted_params[:id]}",
            token: "you post token = #{permitted_params[:token]}"
          }
          message[:message] = if permitted_params[:message]
             "you post message = #{permitted_params[:message]}"
          else
            "you not post message"
          end
          message
        end
      end
    end
  end
end
