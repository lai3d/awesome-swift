require 'github_repo_sort'
require 'json'

CONTENTS = 'contents.json'
REPOS = 'list-repos'

def get_json()
    JSON.parse(File.read CONTENTS)
end
# make list

j = get_json
repos = j['projects']

# warn repos
o = ''

repos.select {|r| r['homepage'].include? 'github'}
  .select{|r| r['homepage'].sub('//github.com/','').include?'/'}
  .each do |r|
  o<<r['homepage'].gsub(/\#.*/,'')
  o<<"\n"
end

require 'date'
date = DateTime.now
date_display = date.strftime "%B-%d-%Y"

f = REPOS
# "#{REPOS}-#{date_display}"
puts "writing #{f}..."
File.open(f, 'w') {|f| f.write o}
