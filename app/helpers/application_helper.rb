module ApplicationHelper
  def safe_external_url(value)
    uri = URI.parse(value.to_s)
    return unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)

    uri.to_s
  rescue URI::InvalidURIError
    nil
  end
end
