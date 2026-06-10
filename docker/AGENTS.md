## Docker Quickstart Policy

- This directory contains user-facing quickstart Docker support. Keep it separate from CI/build Docker and deeper local development workflows.
- The quickstart must not require users to compile Canary locally. Use the published Canary runtime image unless a task explicitly changes that contract.
- `docker-compose.yml` must keep `login-server` as the default client login webservice.
- The default client login URL is `http://localhost:8088/login`; the default web/admin URL is `http://localhost:8080`.
- MyAAC is the website/admin AAC only. Do not point clients to MyAAC `login.php`.
- The MyAAC quickstart image must not include or expose `login.php`.
- MyAAC must build from the `slawkens/myaac` `develop` branch unless a compatibility reason is documented.
- Public Canary-facing environment variables should use the `CANARY_*` prefix. Avoid adding new public `MYSQL_*`, `OT_*`, or raw Lua config variable names.
- Compose may translate `CANARY_*` into variables required by MariaDB, MyAAC, or login-server, but the public configuration contract should remain `CANARY_*`.
- When changing quickstart behavior, update `docker/DOCKER.md` and any helper scripts (`up.sh`, `up.ps1`, `config.sh`) that expose the same workflow.

## Validation

- For quickstart changes, prefer validating `docker compose config` and the specific service or script touched.
- If changing MyAAC bootstrap behavior, verify that the admin site remains on port `8080` and the client login flow remains on `8088/login`.
