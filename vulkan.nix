{ pkgs, ... }:

{
  postFixup = ''
    patchelf --add-rpath ${pkgs.vulkan-loader}/lib $out/bin/*
  '';

  hardware.opengl.extraPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layer
  ];
}