notes

Generate list of plugins:
1. Go to /script
2. Run this script:

    Jenkins.instance.pluginManager.plugins.each{
      plugin -> println ("${plugin.getShortName()}:${plugin.getVersion()}")
    }
