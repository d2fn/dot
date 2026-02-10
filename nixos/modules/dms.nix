{
  config,
  pkgs,
  inputs,
  ...
}:

{

  services.upower.enable = true;
  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
    enableSystemMonitoring = true;
    dgop.package = inputs.dgop.packages.${pkgs.system}.default;
  };

}
