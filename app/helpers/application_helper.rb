module ApplicationHelper
  def icon(name, options = {})
    name = name.to_s.gsub(/[_]+/, "-")
    options[:class] = options[:class].to_s
    class_name = ['icon-' + name, options[:class]].flatten.join(" ").sub(/^\s+/, '').sub(/\s+$/, '')
    "<span class='#{class_name}'></span>".html_safe
  end
end
