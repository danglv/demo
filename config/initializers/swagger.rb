# TODO: authentication
if Rails.env.test?
  base_url = request.protocol + request.host_with_port
else
  base_url = Settings.api.base_url[Rails.env]
end

GrapeSwaggerRails.options.app_url = "#{base_url}/api/#{Settings.api.current_version}"
