{pkgs, ...}: {
  programs.fish.shellAbbrs = {
      rebuild = "sudo nixos-rebuild switch --flake /home/bgevko/nixos#parallels";
      nixos = "cd /home/bgevko/nixos";
      hm = "vi /home/bgevko/nixos/home/bgevko.nix";
      term = "vi /home/bgevko/nixos/home/modules/terminal/terminal.nix";
      aliases = "vi /home/bgevko/nixos/home/modules/terminal/aliases.nix";
      n = "vi /home/bgevko/nixos/home/modules/neovim/neovim.nix";
      nplug = "vi /home/bgevko/nixos/home/modules/neovim/plugins/_plugins.nix";
      nlsp = "vi /home/bgevko/nixos/home/modules/neovim/plugins/lsp.nix";
      ntree = "vi /home/bgevko/nixos/home/modules/neovim/plugins/treesitter.nix";
      nkeys = "vi /home/bgevko/nixos/home/modules/neovim/keymaps.nix";
      ncmds = "vi /home/bgevko/nixos/home/modules/neovim/auto_cmds.nix";
      nopts = "vi /home/bgevko/nixos/home/modules/neovim/opts.nix";
  };
}
