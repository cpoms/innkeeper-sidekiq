require 'innkeeper/sidekiq/version'
require 'sidekiq'

require 'innkeeper/sidekiq/middleware/client'
require 'innkeeper/sidekiq/middleware/server'

module Innkeeper
  module Sidekiq
    module Middleware

      def self.run
        ::Sidekiq.configure_client do |config|
          config.client_middleware do |chain|
            chain.add ::Innkeeper::Sidekiq::Middleware::Client
          end
        end

        ::Sidekiq.configure_server do |config|
          config.client_middleware do |chain|
            chain.add ::Innkeeper::Sidekiq::Middleware::Client
          end

          config.server_middleware do |chain|
            if defined?(::Sidekiq::Batch::Server)
              chain.insert_before ::Sidekiq::Batch::Server, ::Innkeeper::Sidekiq::Middleware::Server
            else
              chain.add ::Innkeeper::Sidekiq::Middleware::Server
            end
          end
        end
      end
    end
  end
end

require 'innkeeper/sidekiq/railtie' if defined?(Rails)
