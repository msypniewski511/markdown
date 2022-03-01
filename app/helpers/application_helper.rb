module ApplicationHelper
  require 'redcarpet/render_strip'

  def has_role?(role)
    current_user && current_user.has_role?(role)
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= 'markdown'
      CodeRay.scan(code, language).div
    end
  end

  def markdown_1(text)
    coderayified = CodeRayify.new(:hard_wrap => true, with_toc_data: true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,
      lax_spacing: true,
      tables: true,
      with_toc_data: true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    
    markdown_to_html.render(text).html_safe
  end

  def strip_markdown(text)
    markdown_to_plain_text = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    markdown_to_plain_text.render(text).html_safe
  end


  def markdown(text)
    # output = ["<div class='toc_text'>"]
    # content = text
    # unsafe_chars_regex = /[ $&+,\/:;=?@\"<>#%{}|\^~\[\]`]+/o

    # # Render the Table of Contents
    # renderer = Redcarpet::Render::HTML_TOC
    # toc_text = Redcarpet::Markdown.new(renderer).render(content)

    # # Fix redcarpet anchor links; see bug
    # # https://github.com/vmg/redcarpet/issues/385
    # toc_text.gsub!(/<a href="(.*)#(.*)">/) do |match|
    #   link_url = $1
    #   fixed_anchor = CGI.unescapeHTML($2).gsub(unsafe_chars_regex, '')

    #   "<a href=\"#{link_url}##{fixed_anchor}\">"
    # end
    # # tmp_toc_wrap = "<div class='toc_text'>"
    # output << toc_text << "</div>"

    # # Then render the content
    # renderer = Redcarpet::Render::HTML.new(with_toc_data: true)
    # body_text = Redcarpet::Markdown.new(renderer).render(content)

    # # Fix redcarpet header IDs user for anchors; see bug
    # # https://github.com/vmg/redcarpet/issues/385
    # body_text.gsub!(/<h([1-6]) id="(.*)"/) do |match|
    #   header_level = $1
    #   fixed_anchor = CGI.unescapeHTML($2).gsub!(unsafe_chars_regex, '')

    #   "<h#{header_level} id=\"#{fixed_anchor}\""
    # end


    output = []
    output << markdown_1(text)

    output.join('').html_safe
  end

  def get_toc(text)
    output = ["<div class='toc_text'>", "<h3 class='title is-5 has-text-grey-light discussion-title'>Table of Content</h3>"]
    content = text
    unsafe_chars_regex = /[ $&+,\/:;=?@\"<>#%{}|\^~\[\]`]+/o

    # Render the Table of Contents
    renderer = Redcarpet::Render::HTML_TOC
    toc_text = Redcarpet::Markdown.new(renderer).render(content)

    # Fix redcarpet anchor links; see bug
    # https://github.com/vmg/redcarpet/issues/385
    toc_text.gsub!(/<a href="(.*)#(.*)">/) do |match|
      link_url = $1
      fixed_anchor = CGI.unescapeHTML($2).gsub(unsafe_chars_regex, '')

      "<a href=\"#{link_url}##{fixed_anchor}\">"
    end
    # tmp_toc_wrap = "<div class='toc_text'>"
    output << toc_text << "</div>"
    output.join('').html_safe
  end
end
