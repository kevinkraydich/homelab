# Beszel

[Beszel](https://beszel.dev/) is simple, lightweight server monitoring.

## Additional setup

### Start hub

```
cd hub
docker compose up -d
```

### Add systems

1. Log into Beszel UI
2. Select `Add system`
3. Fill in fields, copy generated `docker-compose.yml` and add system
4. On system, copy and paste `docker-compose.yml`

```
cd agent
vim docker-compose.yml
<Paste contents and save>
docker compose up -d
```

