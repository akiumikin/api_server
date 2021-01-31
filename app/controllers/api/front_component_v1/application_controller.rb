module Api::FrontComponentV1
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  #   before_action :set_raven_context
  #   before_action :set_gon

    unless Rails.env.development?
      rescue_from Exception, with: :render_500
      rescue_from ActiveRecord::RecordNotFound, with: :render_404
      rescue_from ActionController::RoutingError, with: :render_404
    end

    def render_404(e = nil)
      render status: 404, json: { error_message: '存在しないコンテンツです。' }
    end

    def render_500(e = nil)
      # Raven.capture_exception(e)

      render status: 500, json: { error_message: '不明なエラーです。' }
    end

    private

  #   def set_raven_context
  #     Raven.user_context(id: current_user.id) if current_user
  #     Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  #   end

  #   def set_gon
  #     gon.enums = YAML.load_file("config/locales/enums.ja.yml")
  #   end
  end
end
