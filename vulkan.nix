{ config, pkgs, ... }:

{
  # Enable Vulkan support through Mesa
  hardware.graphics.enable = true;  # Install Mesa and provide Vulkan for supported hardware
  hardware.graphics.enable32Bit = true;

  hardware.graphics.extraPackages = with pkgs; [
    vulkan-tools
    vulkan-validation-layers
    vulkan-loader
  ];

  environment.systemPackages = [ pkgs.mesa-demos ]; # Contains glxinfo

}