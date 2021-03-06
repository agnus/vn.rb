module UsersHelper
  
  def iconify_and_link(links, options={})
    options[:separator] = "\n" if options[:separator].blank?
    links.split(options[:separator]).collect do |link|
      link = link.strip
      icon = String.new
      WEBSITES.each do |website|
        if link.match(/#{website}/) && icon.blank?
          icon += link_to(image_tag("application/social/#{website}_#{options[:size]}.png"), link)
        end
      end
      if icon.blank?
        icon += link_to(image_tag("application/social/web_#{options[:size]}.png"), link)
      end
      "<li>" + icon + " " + link_to(link, link) + "</li>\n"
    end
  end
  
  def show_github_projects_for(user)
    projects = String.new
    user.projects.each do |project|
      projects << "<li>"
      projects << link_to(project.name, "http://github.com/#{user.github_username}/#{project.name}")
      projects << "<span>" + project.description + "</span>"
      projects << "</li>\n"      
    end
    return projects
  end

end