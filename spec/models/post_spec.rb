require "rails_helper"

describe Post do
  describe '#parsed_body' do
    it 'parses crazy react code' do
      markdown = <<~MD
      ```javascript
      <Motion
        defaultStyle={{ x: -200, opacity: 0 }}
        style={{
          x: spring(showForecast ? 0 : -200),
          opacity: spring(showForecast ? 1 : 0)
        }}
      >
        {style => (
          <Forecast
            style={{
              transform: `translateX(${style.x}px)`,
              opacity: style.opacity
            }}
          >
            mapping daily forecast...
          </Forecast>
        )}
      </Motion>
      ```
      MD

      response1 = GitHub::Markdown.render_gfm(markdown).html_safe
      response2 = Kramdown::Document.new(markdown).to_html

      renderer = Redcarpet::Render::HTML.new
      redcarpet = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
      response3 = redcarpet.render(markdown)

      p response1
      p response2
      p response3
    end
  end
end