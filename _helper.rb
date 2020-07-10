# INSTRUCTIONS
# ============
#
# REQUIREMENTS
# ------------
# Make sure the following are present:
# ~/Pictures/PROJECT_NAME
# ~/Pictures/Screenshots
# Make sure files saved to the Screenshots folder are in the following format:
# s yyyy-MM-dd at HH.mm.ss
# s 2020-07-10 at 14.01.12 for example
#
#
# RUN PROGRAM
# -----------
# ruby _helper.rb
#
#
#s DESCRIPTION
# ------------
# 1. The program will search ~/Pictures/Screenshots for the most recent file. 
# 2. Three smaller files will be created using ImageMagick they will be saved in the following paths:
#    ./_assets/images/posts/yyyyMMdd/HHmmss-[xs | sm | md].jpg
#    ./_assets/images/posts/20200707/105846-sm.jpg for example
# 3. A copy of the file will be saved to the following path to prevent cluttering the Screenshots folder:
#    ~/Pictures/PROJECT_NAME/yyyy-MM-dd@HH.mm.ss.jpg
#    ~/Pictures/PROJECT_NAME/2020-07-07@10.58.46.jpg for example


require 'fileutils'
require 'mini_magick'

PROJECT_NAME = 'coderscoffeehouse'

path = "#{ENV['HOME']}/Pictures/Screenshots/*.jpg"

file = Dir.glob(path).max_by { |f| File.mtime(f) }

basename = File.basename file

# copy the file to an images folder for archiving, this is because it's highly unlikely to be required again
# and keeping it in the project will lead to unnecessary bloat
FileUtils.cp file, "#{ENV['HOME']}/Pictures/#{PROJECT_NAME}/#{basename[2, 10]}@#{basename[16, 8]}.jpg"

# create the directory if it does not exist
dirname = "#{File.dirname(File.expand_path __FILE__)}/_assets/images/posts/#{basename[2, 10].gsub('-', '')}"

puts dirname

unless File.directory?(dirname)
  FileUtils.mkdir_p(dirname)
end

sizes = {:xs => 400, :sm => 800, :md => 1200} # :lg => 1600

sizes.each do | size, value |
  image = MiniMagick::Image.open(file)
  image.resize "#{value}x#{value}"
  filename = "#{dirname}/#{basename[16, 8].gsub('.', '')}-#{size}.jpg"
  image.write filename

  puts filename

end

FileUtils.rm file
