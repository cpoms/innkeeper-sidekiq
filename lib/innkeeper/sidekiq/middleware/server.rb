module Innkeeper::Sidekiq::Middleware
  class Server
    def call(worker_class, item, queue)
      Innkeeper::Tenant.switch(item['innkeeper']) do
        yield
      end
    end
  end
end
