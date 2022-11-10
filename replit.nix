{ pkgs }: {
    deps = [
        pkgs.zip
        pkgs.nodejs-16_x
        pkgs.dosbox
        pkgs.qemu
      	
      pkgs.nodejs-16_x
        pkgs.nodePackages.typescript-language-server
        pkgs.yarn
        pkgs.replitPackages.jest
    ];
}