# Torrent

[Gluetun](https://github.com/qdm12/gluetun) is a lightweight VPN client, and [qBitTorrent](https://www.qbittorrent.org/) is a P2P torrent client.

## Additional setup

### Environment variables

Create `.env` with the following variables

```
DOWNLOADS_PATH
TZ
UPDATER_PERIOD
UPDATER_PROTONVPN_EMAIL
UPDATER_PROTONVPN_PASSWORD
VPN_SERVICE_PROVIDER
VPN_TYPE
WIREGUARD_ADDRESSES
WIREGUARD_PRIVATE_KEY
```

### VPN

#### Setup

1. Log into qBitTorrent UI
2. Navigate to `Options -> Connection`
3. Change `Port used for incoming connections` to Gluetun's P2P port

#### Verify

1. Go to [ipleak.net](https://ipleak.net/)
2. Activate `Torrent address detection`
3. Add the magnet link to qBitTorrent
4. Verify that the resulting IP address does NOT match your IP adddress

