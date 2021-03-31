module ApplicationHelper

  def site_or_registration
    true if  (controller_name == "sites") || (controller_name == "registrations")
  end

end
