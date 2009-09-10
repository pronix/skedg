require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProviderType do
  before(:each) do
    @valid_attributes = {
      :name => "free"     
    }
  end

  
  it "должен создать новый экземпляр с верными атрибутами" do
    ProviderType.create!(@valid_attributes)
  end
  describe "при создание" do 
    before(:each){ @provider_type = ProviderType.new(@valid_attributes)}
    
    it "должен быть валидным при верных параметрах" do 
      @provider_type.should be_valid
    end
    %w{name }.each do |f|
      it "должен быть не валидным если отсутсвует поле #{f}" do 
      @provider_type.send("#{f}=", nil)
      @provider_type.should_not be_valid
      end
    end    
  end

end
