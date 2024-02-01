# opt out telemetry
{ ... }:

{
  environment.variables = {
    NEXT_TELEMETRY_DISABLED = "1"; # https://nextjs.org/telemetry
    OASDIFF_NO_TELEMETRY = "1"; # https://github.com/Tufin/oasdiff?tab=readme-ov-file#telemetry
  };
}
