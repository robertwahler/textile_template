module ActionView
  module TemplateHandlers
    class TextileTemplate < ERB
      def compile(template)
        src = super
        "_textile_proc = proc {\n#{src}\n}; RedCloth.new(_textile_proc.call, [:hard_breaks]).to_html.html_safe"
      end

      def cache_fragment(block, name = {}, options = nil) #:nodoc:
        @view.fragment_for(block, name, options) do
          render_textile(eval(ActionView::Base.erb_variable, block.binding))
        end
      end

      private
      def render_textile(result)
        RedCloth.new(result, [:hard_breaks]).to_html.html_safe
      end
    end
  end

  Template.register_template_handler :textile, TemplateHandlers::TextileTemplate

  module VERSION #nodoc
    MAJOR = 0
    MINOR = 1
    TINY = 0
    STRING = [MAJOR, MINOR, TINY].join('.')
  end

end
