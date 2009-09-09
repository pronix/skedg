class Provider::ServiceProviderSessionsController < Provider::ProvidersController
  before_filter :require_no_provider, :only => [:new, :create]
  before_filter :require_provider, :only => :destroy
  def new
    @provider_session = ServiceProviderSession.new
  end
  def create
  end
  def destroy
  end
end
