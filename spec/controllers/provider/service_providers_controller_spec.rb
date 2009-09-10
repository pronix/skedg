require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Provider::ServiceProvidersController do
  before(:each) do 
    controller.stub!(:current_provider).and_return(nil) 
    @service_provider = mock_model(ServiceProvider)
  end
  
  describe "При регистрации нового поставщика услуг GET NEW" do 
    def do_action
      get :new
    end
    before(:each) { ServiceProvider.stub!(:new).and_return(@service_provider) }
    
    it "должен перенаправить на страницу выхода если пользователь авторизован" do 
      controller.stub!(:current_provider).and_return(true)      
      do_action
      response.should redirect_to provider_logout_path
    end
    
    it "должен создать новый объект ПоставщикУслуг" do 
      ServiceProvider.should_receive(:new).and_return(@service_provider)
      do_action
    end
    
    it "должен передать поставщика услуг в форму" do 
      do_action
      assigns[:service_provider].should == @service_provider
    end
    it "должен отобразить форму нового поставщика услуг /new" do 
      do_action
      response.should render_template :new
    end
  end
  describe "При создание нового поставщика услуг POST CREATE" do 
    def valid_params
      {
        "name"=>"test",
        "password_confirmation"=>"FILTERED",
        "phone"=>"", 
        "contribution_type_id"=>"1",
        "password"=>"FILTERED",
        "login"=>"petr",
        "provider_type_id"=>"2",
        "email"=>"test@gmail.com",
        "owner"=>"Федосеев Петр Николаевич"  }
      
    end
    def do_action
      post :create, :service_provider => valid_params
    end
    before(:each) do 
      ServiceProvider.stub!(:new).and_return(@service_provider)
      @service_provider.stub!(:save).and_return(true) 
      ServiceProviderSession.stub!(:create).and_return(true)
    end
    it "должен перенаправить на страницу выхода если пользователь авторизован" do 
      controller.stub!(:current_provider).and_return(true)      
      do_action
      response.should redirect_to provider_logout_path 
    end
    
    it "должен создать нового поставщика услуг с передаваемыми параметрами" do 
      ServiceProvider.should_receive(:new).with(valid_params).and_return(@service_provider) 
      do_action
    end
    describe "при верных параметрах" do 
      it "должен сохранить нового поставщика услуг" do 
        @service_provider.should_receive(:save).and_return(true)
        do_action
      end
      it "должен создать сессию для зарегестрированного поставщика услуг" do 
        ServiceProviderSession.should_receive(:create).with(valid_params).and_return(true)
        do_action
      end
      it "должен отобразить сообщение об успешной регистрации" do 
        do_action
        flash[:notice].should_not be_empty
      end
      it "должен перенаправить пользователя на страницу просмотра личной информации provider_service_providers_path" do 
        do_action
        response.should redirect_to provider_service_providers_path
      end
    end
    describe "при не верных параметрах" do
      it "должен отобразить сообщение об ошибке" do 
        @service_provider.stub!(:save).and_return(false)         
        do_action
        flash[:error].should_not be_empty
      end
      it "должен повторно отобразить форму регистрации new" do 
        @service_provider.stub!(:save).and_return(false)         
        do_action
        response.should render_template :new
      end
    end
  end
  describe "При просмотре личной страницы поставщика услуги GET SHOW" do
    def do_action
      get :show
    end
    before(:each) do 
      @service_provider = mock_model(ServiceProvider)
      controller.stub!(:current_provider).and_return(@service_provider)            
    end
    it "должен выкинуть пользователя на форму авторизации если не авторизован" do 
      controller.stub!(:current_provider).and_return(nil)      
      do_action
      response.should redirect_to provider_login_path
    end
    it "должен передать текущего поставщика услуг в форму" do 
      do_action
      assigns[:service_provider].should == @service_provider
    end
    it "должен отобразить шаблон просомтра информации show" do 
      do_action
      response.should render_template :show
    end
  end
  describe "При редактирование поставщика услуг GET EDIT" do 
  end
  describe "При сохранение поставщика услуг PUT UPDATE" do 
  end
  
end
