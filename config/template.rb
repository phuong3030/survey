# Rails 6.X Template
if defined?(ActionView) && defined?(Rails) && Rails.respond_to?(:version) && Rails.version.to_s =~ /^[6]/
  module ActionView
    module Template::Handlers
      class Rabl
        class_attribute :default_format
        self.default_format = :json

        def self.call(template, source)
          %{ ::Rabl::Engine.new(#{source.inspect}).
              apply(self, assigns.merge(local_assigns)).
              render }
        end
      end
    end
  end

  ActionView::Template.register_template_handler :rabl, ActionView::Template::Handlers::Rabl
end
