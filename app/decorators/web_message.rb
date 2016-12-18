class WebMessage < SimpleDelegator
  def html_content
    ActionController::Base.helpers.sanitize(
      content
    ).gsub(/\n/, '<br />').html_safe
  end
end
