# kebabs.eth received 1 bids and sells for 0.03
# refer.eth received 2 bids and sells for 0.03
# sudan.eth received 2 bids and sells for 0.03
texts = File.open('./dataset/bids.txt').readlines

# rank, name
# 3	,james
# 5	,george
# 6	,frank
boys = File.open('./dataset/boys.csv').readlines
girls = File.open('./dataset/girls.csv').readlines
last = File.open('./dataset/last.csv').readlines
web = File.open('./dataset/web.csv').readlines

@dict = {}
def create_dict(data, key)
   @dict[key] = {}
   data.each do |d|
    #   puts d if key == 'web'
      rank, name, domain = d.split(',').map{|d| d.chop}
      @dict[key][name] = {
          'rank':rank,
          'name':name,
          'domain': domain
      }
   end
end

[[boys, 'boys'], [girls, 'girls'], [last, 'last'], [web, 'web']].each{|d| create_dict(d[0], d[1]) }
# puts @dict['web']
def checkNames(name)
  domain = if @dict['web'][name]
    @dict['web'][name][:domain]
  end
  [!!@dict['boys'][name],!!@dict['girls'][name],!!@dict['last'][name],!!@dict['web'][name], domain]
end

parsed = texts.map do|text|
  matched = text.match(/(?<name>.*)\.eth received (?<bidcount>.*) bids and sells for (?<price>.*)/)
  if matched
    name = matched['name']
    price = matched['price'].to_f
    bidcount = matched['bidcount']
    isboy, isgirl, islast, isweb, domain = checkNames(name)
    {
        'namecount':name.length,
        'bidcount':bidcount.to_i,
        'highestbid':price,
        'name':name,
        'isboy':isboy,
        'isgirl':isgirl,
        'islast':islast,
        'isweb':isweb,
        'iswebdomain': domain
    }
  else
    puts '**** unmatched'  + text
    # [0,0,text]
    false
  end
end.reject{|d| !d }

def display(item, keys)
  keys.map{|key|

    item[key.to_sym]
  }.join("\t")
end
b = {a:2}
b[:a]
puts parsed[0]
parsed = parsed.sort{|a, b| b[:bidcount] <=> a[:bidcount] }


def show_summary(title, rows, count, columns)
  merged = []
  sorted = rows.sort{|a, b| b[:highestbid] <=> a[:highestbid] }
  rows.each_with_index do |row, i|
    s = sorted[i]
    merged[i] = [row[:bidcount], row[:highestbid], row[:name], '',  s[:highestbid], s[:bidcount], s[:name]]
  end
  puts "\n\n"
  puts "## #{title} (#{rows.length})"  
  merged.unshift(%w[bids highest name ___ highest bids name])
  puts merged[0..(count)].map{|d| d.join("\t")}
end

def show_sets(parsed)
  show_summary("Total", parsed, 10, ['bidcount','highestbid', 'name'])

  fourchars = parsed.select{|a| a[:namecount] == 4 }
  show_summary("4 chars", fourchars, 10, ['bidcount','highestbid', 'name'])

  threechars = parsed.select{|a| a[:namecount] == 3 }
  show_summary("3 chars", threechars, 10, ['bidcount','highestbid', 'name'])

  boys = parsed.select{|a| a[:isboy] }
  show_summary("Male", boys, 10, ['bidcount','highestbid', 'name'])

  girls = parsed.select{|a| a[:isgirl] }
  show_summary("Female", girls, 10, ['bidcount','highestbid', 'name'])

  last = parsed.select{|a| a[:islast] }
  show_summary("Last name", last, 10, ['bidcount','highestbid', 'name'])

  webs = parsed.select{|a| a[:isweb] }
  show_summary("web", webs, parsed.length, ['bidcount','highestbid', 'name'])
end

show_sets(parsed)

puts "Total"
puts "#{parsed.length}"
puts parsed.map{|row| row[:highestbid]}.inject(0){|sum, x | sum + x }