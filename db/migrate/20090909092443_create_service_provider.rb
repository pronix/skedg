class CreateServiceProvider < ActiveRecord::Migration
  def self.up
    create_table :service_providers do |t|
      t.string  :name, :null => false                    # Наименование бизнеса
      t.integer :contribution_type_id, :null => false    # сфера деятельности
      t.integer :provider_type_id, :null => false        # тип поставщика услуг из т.з.
      t.string  :owner                                   # владелец
      # ----- Address
      t.integer :country_id 	          # страна
      t.integer :city_id 	              # город
      t.string  :address                # адрес
      t.string  :email, :null => false  #	электронная почта
      t.string  :phone                  # телефон
      t.string  :web                    #	веб адрес  

      t.string :login, :null => false             # имя для входа в систему
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      
      t.text :description                         #	описание
      
      t.string  :sms_number_for_event             # смс номер для получение уведомлений
      t.integer :sms_event_type_id                #	опция для того как получать уведомление по смс
      t.string  :email_for_event 	                # email для получение уведомлений
      t.integer :emeil_event_type_id 	            #	опции для получение уведомлений по email
      t.string  :phone_for_event 	                #	тел. номер для автом. звонком
      t.integer :phone_event_type_id 	 	  	  	  # опции для автом. телефонных звонков
      t.string  :status
      t.timestamps
    end
    add_index :service_providers, :login
    add_index :service_providers, :persistence_token    
  end

  def self.down
    drop_table :service_providers
  end
end
