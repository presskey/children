Children (Building Daemon Family)
===

Starts one parent daemon and N child processes

Installation
---

    gem install children
    
Examples
---

Starting daemon with 3 child processes named 'test' and parent pidfile '/tmp/test.pid':
```ruby
require 'children'

children(3, 'test', '/tmp/test.pid') do
  stopped = false; trap("TERM") { stopped = true }
  loop { break if stopped; nil } # replace nil with any functionality you need
end
```

After script execution process list will look like the one below:

    PID |PPID|COMMAND
    2235|   1|test:parent 
    2236|2235|test       
    2237|2235|test        
    2238|2235|test 
    
Sending **TERM** signal to parent process ( *kill 2235* ) will also stop all children (it's up to you to implement graceful shutdown using ```trap("TERM"){}```)

Script relaunching will lead to restarting of processes.
