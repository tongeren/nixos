{ config, pkgs, ... }:

{
  # Enable Vulkan support through Mesa
  hardware.graphics.enable = true;  # Install Mesa and provide Vulkan for supported hardware
  hardware.graphics.enable32Bit = true;

  environment.systemPackages = with pkgs; [ 
    mesa-demos # Contains glxinfo
    vulkan-tools
    vulkan-validation-layers
    vulkan-loader
  ];
}