class TextileTemplate < ActionView::TemplateHandlers::ERB
  # TODO: revert back to 2.2.1 code (see below) rails 2.2.2 broke this, waiting for 2.2.3
  def self.call(template)
    "ActionView::TemplateHandlers::ERB::TextileTemplate.new.render(template, local_assigns)"
  end
  def render(template, local_assigns = {})
#    erb_processed = compile(template)
#    RedCloth.new(erb_processed, [ :hard_breaks ]).to_html
    RedCloth.new(template.source, [ :hard_breaks ]).to_html
    #erb_processed = compile(template)
    #r = eval erb_processed
    #RedCloth.new(r, [ :hard_breaks ]).to_html
  end
# rails 2.2.1 and lower
#  def render(template)
#    RedCloth.new(super(template), [ :hard_breaks ]).to_html
#  end
end