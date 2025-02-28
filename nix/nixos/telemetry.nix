# opt out telemetry
{ ... }:

{
  environment.variables = {
    NEXT_TELEMETRY_DISABLED = "1"; # https://nextjs.org/telemetry/
    NUXT_TELEMETRY_DISABLED = "1"; # https://github.com/nuxt/telemetry#opting-out
    OASDIFF_NO_TELEMETRY = "1"; # https://github.com/Tufin/oasdiff?tab=readme-ov-file#telemetry
    DOTNET_CLI_TELEMETRY_OPTOUT = "1"; # https://learn.microsoft.com/en-us/dotnet/core/tools/telemetry#how-to-opt-out
    REDOCLY_TELEMETRY = "off"; # https://github.com/Redocly/redocly-cli/tree/main#data-collection
  };
}
