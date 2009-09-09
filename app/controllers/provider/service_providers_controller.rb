class Provider::ServiceProvidersController < Provider::ProvidersController
  before_filter :require_no_provider, :only => [:new, :create]
  before_filter :require_provider, :only => [:show, :edit, :update]

  def new
    @service_provider = ServiceProvider.new
  end

  def create
    @service_provider = ServiceProvider.new params[:service_provider]
    if @service_provider.save
      ServiceProviderSession.create(params[:service_provider])
      flash[:notice] = t("controller.client.success_register")
      redirect_back_or_default provider_service_providers_path
    else
      render :action => :new
    end
  end
  
  def show
    @service_provider = current_provider
  end
  
end
