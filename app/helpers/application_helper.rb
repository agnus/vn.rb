module ApplicationHelper
  include SavageBeast::ApplicationHelper
  def current_user
    @controller.send :current_user
  end
  
  def current_user_is?(user)
    current_user == user
  end
  
  def display_flash_using(tag)
    key = [:notice, :warning, :error].find {|key| flash.key?(key)}
    unless key.blank?
      content_tag(tag.to_s, flash[key], :class => "flash #{key}")
    end
  end
  
  def error_messages_for(object_name, options = {})
    options = options.symbolize_keys
    object = instance_variable_get("@#{object_name}")
    if object && !object.errors.empty?
      content_tag("div",
          content_tag("p", "Hey, there&rsquo;s a problem&hellip;") +
          content_tag("ul", object.errors.full_messages.collect { |msg| content_tag("li", msg) }),
          "id" => options[:id] || "errors"
          )
    else
        ""
    end
  end
  
  def request_host
    if RAILS_ENV == "development"
      "http://#{request.host}:#{request.port}"
    else
      "http://sdruby.com"
    end
  end

  def check_if_active(controller)
  
    if @controller.controller_name == controller.to_s
      return "active"
    elsif @controller.action_name == controller.to_s
      return "active"
    else
      return nil
    end

  end
  
  def get_next_meeting
    today = Time.now
    monday = today.beginning_of_month.monday
    thursday = monday + (3600 * 24 * 3)
    if thursday.month != today.month
      thursday = thursday + (3600 * 24 * 7)
    end
    if thursday < today
      thursday = thursday + (3600 * 24 * 28)
      if thursday.month == today.month
        thursday = thursday + (3600 * 24 * 7)
      end      
    end
    return thursday.to_date
  end
end

