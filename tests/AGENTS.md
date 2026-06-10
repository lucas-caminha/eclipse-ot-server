## Test Policy

- Tests use GoogleTest and are registered through the nearest `CMakeLists.txt` with `target_sources`.
- Put new unit tests under `tests/unit` and integration tests under `tests/integration`, matching the source module layout when possible.
- Keep tests focused on observable behavior and regression risk; avoid broad fixture churn unless the behavior requires it.
- For Windows validation with tests, prefer:

```powershell
cmake --preset windows-release-enabled-tests
cmake --build --preset windows-release-enabled-tests
.\build\windows-release-enabled-tests\tests\unit\canary_ut.exe
.\build\windows-release-enabled-tests\tests\integration\canary_it.exe
```

- Integration tests use `tests/test.env` unless `TEST_ENV_FILE` is set.
- Treat the default integration database as disposable only when it is clearly a test database and reset is explicitly enabled with `TEST_DB_ALLOW_RESET=1`.
- Do not point integration tests at production or player/account databases.
- If a test requires `schema.sql`, prefer the CMake-provided path or set `TEST_DB_SCHEMA` rather than copying schema files.
