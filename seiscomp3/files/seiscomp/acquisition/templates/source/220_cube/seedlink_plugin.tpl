* template: #template#
plugin cube_#statid# cmd="#pkgroot#/bin/cube_plugin #daemon_opt# -v -i #pkgroot#/config/plugins.ini -c #pkgroot#/config/cubeconfig.txt -s #comport#"
          timeout = 0
          start_retry = 60
          shutdown_wait = 10

