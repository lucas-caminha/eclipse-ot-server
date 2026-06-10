## Source Code Policy

- Follow the existing Canary C++ style and module boundaries. Prefer local patterns and helper APIs over new abstractions.
- Keep changes scoped to the feature or bug being handled; avoid drive-by refactors in unrelated subsystems.
- C++ code uses C++20+ and the repository `.clang-format`; comments must be in English and should explain non-obvious behavior only.
- Register new source files in the nearest `CMakeLists.txt` using the surrounding pattern.
- For persistent gameplay or account data, use the KV system instead of adding new MySQL tables or legacy storage. See `src/kv/README.md`.
- Performance-sensitive gameplay logic belongs in C++ rather than complex Lua scripts when it affects hot paths, many players, or frequent events.
- When touching Lua bindings, keep the C++ API, Lua API behavior, validation, and tests aligned.
- Prefer explicit validation and clear failure logging around config, database, network, and player-facing state transitions.

## Validation

- For compile-sensitive changes, prefer the repository CMake preset workflow from the root. On Windows, use the Visual Studio developer environment as described in the root `AGENTS.md`.
- Add or update focused tests under `tests/` when changing shared logic, persistence, security, game mechanics, Lua APIs, or bug-prone behavior.
