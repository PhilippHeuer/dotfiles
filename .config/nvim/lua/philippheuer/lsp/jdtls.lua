return {
  filetypes = { "java" },
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  java = {
    configuration = {
      runtimes = {
        {
          name = "JavaSE-17",
          path = "/usr/lib/jvm/java-17-openjdk-amd64/",
          default = true,
        },
      },
    },
    import = {
      gradle = {
        enabled = true,
        offline = true,
        jvmArguments = "yalo",
        wrapper = {
          enabled = true,
          checksums = {},
        },
      },
    },
  },
}
