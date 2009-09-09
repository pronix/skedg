require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Provider::ServiceProvidersController do

  describe "При регистрации нового поставщика услуг GET NEW" do 
    it "должен перенаправить на страницу выхода если пользователь авторизован"
    it "должен создать новый объект ПоставщикУслуг"
    it "должен передать поставщика услуг в форму"
    it "должен отобразить форму нового поставщика услуг /new"
  end
  describe "При создание нового поставщика услуг POST CRETAE" do 
    it "должен перенаправить на страницу выхода если пользователь авторизован"
    it "должен создать нового поставщика услуг с передаваемыми параметрами" 
    describe "при верных параметрах" do 
      it "должен сохранить нового поставщика услуг"
      it "должен создать сессию для зарегестрированного поставщика услуг"
      it "должен отобразить сообщение об успешной регистрации"
      it "должен перенаправить пользователя на страницу просмотра личной информации provider_service_providers_path"
    end
    describe "при не верных параметрах" do
      it "должен отобразить сообщение об ошибке"
      it "должен повторно отобразить форму регистрации new"
    end
  end
  describe "При просмотре личной страницы поставщика услуги GET SHOW" do
    it "должен выкинуть пользователя на форму авторизации если не авторизован"
    it "должен передать текущего поставщика услуг в форму"
    it "должен отобразить шаблон просомтра информации show"
  end
  describe "При редактирование поставщика услуг GET EDIT" do 
  end
  describe "При сохранение поставщика услуг PUT UPDATE" do 
  end
  
end
