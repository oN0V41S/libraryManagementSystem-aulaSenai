{ pkgs }: {
    deps = [
      pkgs.mysql-client
      pkgs.mysql80
      pkgs.postgresql_16
      pkgs.cowsay
    ];
}