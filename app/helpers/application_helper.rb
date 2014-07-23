module ApplicationHelper

  def title(title = nil)
    if title.present?
      content_for :title, title
    else
      content_for?(:title) ? APP_CONFIG['default_title'] + ' | ' + content_for(:title) : APP_CONFIG['default_title']
    end
  end
  
  def meta_keywords(tags = nil)
    if tags.present?
      content_for :meta_keywords, tags
    else
      content_for?(:meta_keywords) ? [content_for(:meta_keywords), APP_CONFIG['meta_keywords']].join(', ') : APP_CONFIG['meta_keywords']
    end
  end

  def meta_description(desc = nil)
    if desc.present?
      content_for :meta_description, desc
    else
      content_for?(:meta_description) ? content_for(:meta_description) : APP_CONFIG['meta_description']
    end
  end  
  
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
  
  def get_url(action,url_id)
  	if(action == "url")
  		@url = Url.find(url_id)
  		@url.url
  	end
  end
end
