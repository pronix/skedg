require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ServiceProvider do
  before(:each) do
    @valid_attributes = {
      :name => "Студия загара 'До солнца!'",
      :login => "login",
      :password => "password",
      :password_confirmation => "password",
      :email => "password@gmail.com",
      :contribution_type_id => "1",
      :provider_type_id => "1"
    }
  end

  it "должен создать новый экземпляр с верными атрибутами" do
    ServiceProvider.create!(@valid_attributes)
  end
  describe "при создание" do 
    
    before(:each){ @service_provider = ServiceProvider.new(@valid_attributes)}
    
    it "должен быть валидным при верных параметрах" do 
      @service_provider.should be_valid
    end
    %w{name contribution_type_id provider_type_id }.each do |f|
      it "должен быть не валидным если отсутсвует поле #{f}" do 
        @service_provider.send("#{f}=", nil)
        @service_provider.should_not be_valid
      end
    end    
  end
end
