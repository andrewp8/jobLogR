module ApplicationHelper

  def markdown_to_html(markdown_content)
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
      markdown = Redcarpet::Markdown.new(renderer, extensions = {autolink: true, no_intra_emphasis: true})
      markdown.render(markdown_content).html_safe
  end

  def set_flash_error(object)
    flash[:error] = object.errors.full_messages.to_sentence if object.errors.any?
  end
end
