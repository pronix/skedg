require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Provider::ProviderSessionsController do

  #Delete these examples and add some real ones
  it "should use Provider::ProviderSessionsController" do
    controller.should be_an_instance_of(Provider::ProviderSessionsController)
  end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
end
