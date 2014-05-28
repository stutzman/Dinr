module MainHelper

  def get_event_url(event)
    "#{event.id}/#{URI.escape(event.name)}"
  end

end