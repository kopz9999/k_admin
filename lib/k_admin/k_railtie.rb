module KAdmin

  class KRailtie < Rails::Railtie

    def load_locales
      locales_path = File.expand_path("../../../config/locales", __FILE__)
      results = File.join(locales_path, '*.{rb,yml}')
      config.i18n.load_path += Dir[ results ]
    end

    initializer "kadmin locales" do
      load_locales
    end

  end

end
