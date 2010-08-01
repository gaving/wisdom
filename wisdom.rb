#!/usr/bin/env ruby

PREFIX = File.join(ENV['HOME'], 'local')
DATAFILES = File.join(PREFIX, 'share/wisdom/data')

fortunes = Dir.glob(File.join(DATAFILES, '*')).reject {
    |filename| File.extname(filename)== '.dat'
}.join(' ')

args = ARGV.join(' ')

system("fortune #{args} #{fortunes}") unless fortunes.empty?
