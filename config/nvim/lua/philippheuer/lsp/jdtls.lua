return {
  executable = 'jdtls',
  filetypes = { 'java' },
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  java = {
    configuration = {
      runtimes = {
        {
          name = 'JavaSE-21',
          -- find path with the following command:
          -- echo "$(nix eval nixpkgs-unstable#jdk21.outPath | tr -d "\"")/lib/openjdk"
          path = '/nix/store/3vhlpdyqkrwk9arf84iaxk935r71rxvx-openjdk-21.0.5+11/lib/openjdk',
          default = true,
        },
      },
    },
    import = {
      gradle = {
        enabled = true,
        offline = true,
        jvmArguments = '',
        wrapper = {
          enabled = true,
          checksums = {},
        },
      },
    },
  },
}
