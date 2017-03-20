module ApplicationHelper
	def title(page_title)
		content_for(:title) { page_title }
	end

  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end

  def yield_meta_tag(tag, default_text='')
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

end
