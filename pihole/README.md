# Pi-Hole

[Pi-hole](https://pi-hole.net/) is a network-wide ad blocker.

## Additional setup

### Environment variables

Create `.env` with the following variables

```
    PASSWORD
```

### Block lists

1. Go to `Lists` -> `Add a new subscribed list`
2. Add these lists
```
https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/pro.txt
```
