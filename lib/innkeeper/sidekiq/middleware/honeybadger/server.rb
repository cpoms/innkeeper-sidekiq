module Innkeeper::Sidekiq::Middleware::Honeybadger
  class Server
    def call(worker_class, item, queue)
      Honeybadger.context({tenant: Innkeeper::Tenant.current})

      yield
    end
  end
end
