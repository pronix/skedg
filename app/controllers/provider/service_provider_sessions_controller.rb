class Provider::ServiceProviderSessionsController < Provider::ProvidersController
  before_filter :require_no_provider, :only => [:new, :create]
  before_filter :require_provider, :only => :destroy
  def new
    @provider_session = ServiceProviderSession.new
  end
  def create
    @provider_session = ServiceProviderSession.new params[:service_provider_session]
    if @provider_session.save
      flash[:notice] = t_controller("notice.login")
      redirect_back_or_default provider_service_providers_path
    else
      render :action => :new
    end   
    
  end
  def destroy
    current_provider_session.destroy
    flash[:notice] =  t_controller("notice.logout")
    redirect_back_or_default provider_login_path
  end
end
