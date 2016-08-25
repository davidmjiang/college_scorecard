module SchoolsHelper

  def to_percent(value)
    if value.nil?
      "N/A"
    else
      "#{(value*100).round(2)}%"
    end
  end

end
