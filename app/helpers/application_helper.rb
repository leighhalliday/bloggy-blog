module ApplicationHelper

  def locale_links
    Idioma.conf.locales.each_with_object([]) do |locale, ary|
      language = Language.native_name(locale).capitalize
      ary << if locale.to_s == I18n.locale.to_s
        link_to(language, "#")
      else
        link_to(language, params.merge(locale: locale))
      end
    end
  end

  def admin_locale_links
    Idioma.conf.locales.each_with_object([]) do |locale, ary|
      language = Language.native_name(locale).capitalize
      ary << link_to(language, params.merge(locale: locale))
    end
  end

  def parse_summary(post)
    if post.summary.present?
      post.summary.html_safe
    else
      truncate(strip_tags(parse_markdown(post.body)), length: 300).html_safe
    end
  end

  def parse_markdown(text)
    renderer = Redcarpet::Render::HTML.new
    redcarpet = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    redcarpet.render(text).html_safe
  end

  def gallery(upload_id, &block)
    content = yield
    render partial: "admin/common/gallery", locals: {upload_id: upload_id, content: content}
  end
end
