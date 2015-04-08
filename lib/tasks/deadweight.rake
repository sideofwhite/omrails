# lib/tasks/deadweight.rake

require 'deadweight'

Deadweight::RakeTask.new do |dw|
  dw.stylesheets = ["/stylesheets/styles.css.scss"]
  dw.pages = ["/"]
end