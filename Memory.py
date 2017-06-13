domainRuntime()
 
servers = domainRuntimeService.getServerRuntimes();
print('################################################################')
print('# Java heap information per server')
print('################################################################')
print('%20s %10s %8s %8s %4s' % ('Server','Current','Free','Max','Free'))
for server in servers:
   free    = int(server.getJVMRuntime().getHeapFreeCurrent())/(1024*1024)
   freePct = int(server.getJVMRuntime().getHeapFreePercent())
   current = int(server.getJVMRuntime().getHeapSizeCurrent())/(1024*1024)
   max     = int(server.getJVMRuntime().getHeapSizeMax())/(1024*1024)
   print('%20s %7d MB %5d MB %5d MB %3d%%' % (server.getName(),current,free,max,freePct))
 
disconnect()
exit()
