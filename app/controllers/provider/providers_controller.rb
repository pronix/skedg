class Provider::ProvidersController < ApplicationController
  helper_method :current_provider_session, :current_provider
  layout  "provider" 
  
  private
  # текущая сессия поставщика услуг
  def current_provider_session
    return @current_provider_session if defined?(@current_provider_session)
    @current_provider_session = ServiceProviderSession.find
  end
  # текущий поставщик услуг
  def current_provider
    return @current_provider if defined?(@current_provider)
    @current_provider = current_provider_session && current_provider_session.record
  end
    
  # фильтр проверяет что поставщик услуг авторизован в системе
  def require_provider
    unless current_provider
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to provider_login_url
      return false
    end
  end
  # фильтр проверяет что поставщие не авторизован в системе
  def require_no_provider
    if current_provider
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to provider_logout_url
      return false
    end
  end
  
  # сохраннение адреса с которой пришел запрос
  def store_location
    session[:return_to] = request.request_uri
  end
  
  # редирект на предыдущию страницу или на указаную
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
