require 'fileutils'

def children(n, name = nil, pid_file = '/tmp/children.pid', &block)
  raise 'No block, no life.' unless block_given?

  Process.kill('TERM', IO.read(pid_file).to_i) rescue nil
  Process.daemon(true)
  IO.write(pid_file, Process.pid)

  $0 = "#{name}:parent" if name

  n.times do
    fork { $0 = name if name; block.call; }
  end

  trap("TERM") {|signal| FileUtils.rm(pid_file); Process.kill(signal, -Process.getpgrp)}
  Process.waitall
end