module ApplicationHelper
	def title(page_title)
		content_for(:title) { page_title }
	end

 	def meta_description(desc)
      		content_for :meta_description, desc
    end
end
