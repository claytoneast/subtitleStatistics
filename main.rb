listOfWords = []

Dir.glob("#{ARGV[0]}*.srt") do |srt_file|
  File.readlines(srt_file).each do |line|
    next if line.length == 0 || line =~ /\d/ || line == "\r\n"
    puncStrippedLine = line.downcase.gsub(/[^a-z0-9\s]/i, '').gsub(/\r\n/,'')
    splittedLine = puncStrippedLine.split(" ")
    listOfWords.push(*splittedLine)
  end
  puts "============ srt_file ============= #{srt_file}"
  puts "============ listOfWords.length not unique ============= #{listOfWords.length}"
  listOfWords.uniq!
  puts "============ listOfWords.length ============= #{listOfWords.length}"
end
