{ pkgs-stable, ... }:
{
  # https://www.youtube.com/watch?v=zRJDWm1Axq4
  users.users.tcenterdrive.isSystemUser = true;
  users.users.tcenterdrive.group = "tcenterdrive";
  users.groups.tcenterdrive = { };

  systemd.tmpfiles.rules = [
    "d /var/lib/tcenterdrive 0770 tcenterdrive tcenterdrive"
    "d /var/lib/tcenterdrive/storage 0770 tcenterdrive tcenterdrive"
  ];

  systemd.services.tcenterdrive = {
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      User = "tcenterdrive";
      Restart = "on-failure";
      ExecStart = ''
        ${pkgs-stable.filebrowser}/bin/filebrowser config set \
           --database /var/lib/tcenterdrive/filebrowser.db \
           --branding.name "tcenterDrive"

          ${pkgs-stable.filebrowser}/bin/filebrowser \
           --port 8081 \
           --database /var/lib/tcenterdrive/filebrowser.db \
           --root /var/lib/tcenterdrive/ \
           --cache-dir /var/cache/tcenterdrive \
           --disable-exec
      '';
    };
  };
}
