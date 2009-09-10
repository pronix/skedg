require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Provider::ServiceProviderSessionsController do

  describe "При заведение новой сессии GET NEW" do 
    def do_action
      get :new
    end
    before(:each) {
      controller.stub!(:current_provider).and_return(nil) 
      @provider_session = mock_model(ServiceProviderSession)
      ServiceProviderSession.stub!(:new).and_return(@provider_session)
    }
    it "должен перенаправить на страницу выхода если пользователь авторизован"  do 
      controller.stub!(:current_provider).and_return(true)
      do_action
      response.should redirect_to provider_logout_path
    end
    it "должен создать новый экземпляр сессии" do 
      ServiceProviderSession.should_receive(:new).and_return(@provider_session)
      do_action
    end
    it "должен передать новую сессию в шаблон" do 
      do_action
      assigns[:provider_session].should == @provider_session
    end
    it "должен отобразить шаблон авторизации поставщика new" do 
      do_action
      response.should render_template(:new)
    end
  end
  describe "при создание новой сессии POST CREATE" do 
    def valid_params
      { "login" => "login", "password" => "password", "confirmation_password" => "password" }
    end
    def do_action
      post :create, :service_provider_session => valid_params
    end
    before(:each) {
      controller.stub!(:current_provider).and_return(nil) 
      @provider_session = mock_model(ServiceProviderSession)
      ServiceProviderSession.stub!(:new).and_return(@provider_session)
      @provider_session.stub!(:save).and_return(true)
    }
    it "должен перенаправить на страницу выхода если пользователь авторизован"  do 
      controller.stub!(:current_provider).and_return(true)
      do_action
      response.should redirect_to provider_logout_path
    end

    it "должен создать новую сессию с передаваемыми параметрами" do 
      ServiceProviderSession.should_receive(:new).with(valid_params).and_return(@provider_session)      
      do_action
    end
    describe "при верных параметра" do 
      it "должен сохранить сессию" do 
        @provider_session.should_receive(:save).and_return(true)
        do_action
      end
      it "должен вывести сообщение об успешной авторизации" do 
        do_action
        flash[:notice].should_not be_empty
      end
      it "должен перенаправить поставщика на provider_service_providers_path" do 
        do_action
        response.should redirect_to provider_service_providers_path
      end
    end
    describe "при не верных параметрах " do 
      before(:each) { @provider_session.stub!(:save).and_return(false) }
      it "должен вывести сообщение об ошибке" do 
        do_action
        flash[:error].should_not be_empty
      end
      it "должен повторно отобразить шаблон авторизации new" do 
        do_action
        response.should render_template :new
      end
    end
  end
  describe "При удаление сессии" do 
    def do_action
      delete :destroy
    end
    before(:each) { 
      @provider_session = mock_model(ServiceProviderSession)
      controller.stub!(:current_provider).and_return(@provider_session)
      controller.stub!(:current_provider_session).and_return(@provider_session)       
      @provider_session.stub!(:destroy).and_return(true)
    }
    it "должен перенаправить на страницу входа если пользователь не авторизован" do 
      controller.stub!(:current_provider).and_return(nil)   
      do_action
      response.should redirect_to provider_login_path
    end
    it "должен удалить сессию текущего поставщика" do 
      @provider_session.should_receive(:destroy).and_return(true)
      do_action
    end
    it "должен вывести сообщение о выходе из системы" do 
      do_action
      flash[:notice].should_not be_empty
    end
    it "должен перенаправить пользователя на страницу входа provider_login_path" do 
      do_action
      response.should redirect_to provider_login_path
    end
  end
end
