module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix "api"
        version "v1", using: :path
        default_format :json
        format :json
        formatter :json, Grape::Formatter::ActiveModelSerializers

        helpers do
          def permitted_params
            @permitted_params ||= declared(params,
               include_missing: false)
          end

          def logger
            Rails.logger
          end
        end

        rescue_from ActiveRecord::RecordNotFound do |e|
          error!(({error: e.message}),
            Settings.status.not_found)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          error!(({error: e.message}),
            Settings.status.invalid)
        end

        rescue_from ActiveRecord::RecordNotUnique do |e|
          error!(({error: e.message}),
            Settings.status.conflict)
        end

        rescue_from Grape::Exceptions::ValidationErrors do |e|
          error!(({error: e.message}),
            Settings.status.bad_request)
        end
      end
    end
  end
end
