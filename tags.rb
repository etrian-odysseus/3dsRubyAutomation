#!/usr/bin/env ruby

macFilePath = '/Users/emonk/development/ruby/rubyTagScript/macList'

jxaPath = '/Users/emonk/development/jxa/jxaSharing.js.scpt'

jxaCommand = 'osascript ' + jxaPath

# read in the list of mac addresses to spoof line by line, wait 30 seconds for tag, prompt for user input after 10 lines

i = 0
IO.foreach(macFilePath) {
  |line| system ('ifconfig en1 ether #{line}')
  
  system jxaCommand #run new javascript for automation sharing script
  
  i += 1
  
  if (i == 10)
    i = 0
    print 'Press enter to continue'
    gets.strip 
  end
}




