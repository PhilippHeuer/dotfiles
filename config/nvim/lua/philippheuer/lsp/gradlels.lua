return {
  filetypes = { "groovy", "kotlin" },
  init_options = {
    settings = {
      gradleWrapperEnabled = true
    },
  },
  --root_dir = root_pattern({"settings.gradle", "build.gradle", "build.gradle.kts", "settings.gradle.kts"}),
}
