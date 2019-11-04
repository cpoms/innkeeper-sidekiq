module Innkeeper::Sidekiq
  class Railtie < Rails::Railtie
    initializer "innkeeper.sidekiq" do
      Innkeeper::Sidekiq::Middleware.run
    end
  end
end
