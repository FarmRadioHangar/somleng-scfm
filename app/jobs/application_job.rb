class ApplicationJob < ActiveJob::Base
  retry_on ActiveRecord::StaleObjectError

  def self.parse_queue_name(queue_url)
    if (queue_url)
      queue_url.split("/").last
    else
      queue_url
    end
  end

  def self.default_queue_name
    parse_queue_name(Rails.configuration.app_settings.fetch("default_queue_url"))
  end

  queue_as(default_queue_name)
end
