let
  pkgs = import ./nixpkgs.nix { config = { allowUnfree = true; }; };

  pure565 = pkgs.recurseIntoAttrs (pkgs.callPackage ./nixGL.nix {
    nvidiaVersion = "565.77";
    nvidiaHash = "sha256-CnqnQsRrzzTXZpgkAtF7PbH9s7wbiTRNcM0SPByzFHw=";
  });

  pure550 = pkgs.recurseIntoAttrs (pkgs.callPackage ./nixGL.nix {
    nvidiaVersion = "550.135";
    nvidiaHash = "sha256-ESBH9WRABWkOdiFBpVtCIZXKa5DvQCSke61MnoGHiKk=";
  });

  versionFile440 = (pkgs.callPackage ./nixGL.nix {
    nvidiaVersionFile = pkgs.writeText "nvidia-version-440.82" ''
      NVRM version: NVIDIA UNIX x86_64 Kernel Module  440.82  Wed Apr  1 20:04:33 UTC 2020
      GCC version:  gcc version 9.3.0 (Arch Linux 9.3.0-1)
    '';
  });

  versionFile510 = (pkgs.callPackage ./nixGL.nix {
    nvidiaVersionFile = pkgs.writeText "nvidia-version-510.54" ''
      NVRM version: NVIDIA UNIX x86_64 Kernel Module  510.54  Wed Apr  1 20:04:33 UTC 2020
      GCC version:  gcc version 9.3.0 (Arch Linux 9.3.0-1)
    '';
  });

  versionFile565 = (pkgs.callPackage ./nixGL.nix {
    nvidiaVersionFile = pkgs.writeText "nvidia-version-565.77" ''
      NVRM version: NVIDIA UNIX Open Kernel Module for x86_64  565.77  Release Build  (nixbld@)  Sun Feb  9 11:08:26 UTC 2025
      GCC version:  gcc version 13.3.0 (GCC)
    '';
  });

in
  (with pure565; [nixGLIntel nixVulkanNvidia nixGLNvidia nixVulkanIntel])
  ++
  (with pure550; [nixGLIntel nixVulkanNvidia nixGLNvidia nixVulkanIntel])
  ++
  # (with versionFile440.auto; [nixGLNvidia nixGLDefault nixVulkanNvidia])
  # ++
  # (with versionFile510.auto; [nixGLNvidia nixGLDefault nixVulkanNvidia])
  # ++
  (with versionFile565.auto; [nixGLNvidia nixGLDefault nixVulkanNvidia])
