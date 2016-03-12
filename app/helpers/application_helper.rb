module ApplicationHelper

	def can_edit?(classified)
	  if classified.user == session[:user]
	  	return true
	  else
	  	return false
	  end
	end

	def page_header(page_header)
		content_for(:page_header) {page_header.to_s}
	end


	def title(text)
		content_for(:title) {text.to_s}
	end

	def description(text)
		content_for(:description) {text.to_s}
	end

	def tags_cloud(tags, classes)
		max = tags.sort_by(&:count).last
		tags.each do |tag|
			index = tag.count.to_f / max.count * (classes.size-1)
			yield(tag, classes[index.round])
		end
	end

	def tag_links(tags)
		tags.split(",").map {|tag| link_to tag.strip, tag_path(tag.strip)}.join(", ")
	end
end
