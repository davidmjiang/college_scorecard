module SchoolsHelper

  def to_percent(value)
    if value.nil?
      "N/A"
    else
      "#{(value*100).round(2)}%"
    end
  end

  def subject_name(subject)
    subject.split(" ")[2..-1].join(" ")
  end

end
