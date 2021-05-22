# context
class Report
  attr_reader :title, :text

  def initialize(&formatter)
    @title = '月次報告'
    @text = ['順調', '最高の調子']
    @formatter = formatter
  end

  def output_report
    @formatter.call(self)
  end
end

# Strategy
HTML_FORMATTER = lambda do |context|
  puts "<p>#{context.title}</p>"
  puts "<p>#{context.text}</p>"
end

PLAIN_TEXT_FORMATTER = lambda do |context|
  puts "#{context.title}"
  puts "#{context.text}"
end

html_report = Report.new(&HTML_FORMATTER)
html_report.output_report

plain_text_report = Report.new(&PLAIN_TEXT_FORMATTER)
plain_text_report.output_report
