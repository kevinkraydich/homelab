# Beszel

[Beszel](https://beszel.dev/) is simple, lightweight server monitoring.

## Additional setup

### Start hub

```
cd hub
docker compose up -d
```

### Add agent

1. Log into Beszel UI
2. Select `Add system`
3. Fill in fields, copy generated `docker-compose.yml` and add system
4. `cd agent && vim .env` and paste, remove Docker settings, and reformat environment variables
5. `docker compose up -d`

### More features

[Adding additional disks](https://beszel.dev/guide/additional-disks)

[S.M.A.R.T. monitoring](https://beszel.dev/guide/smart-data)


