# Flutter Bloc Clean Architecture Template

A Flutter starter template that follows **Uncle Bob's Clean Architecture**, with **BLoC** for state management. Use it as a base for new apps to keep concerns separated and dependencies pointing inward.

## Architecture Overview

Dependencies flow **inward**: outer layers depend on inner layers; the domain layer does not depend on app or data.

```
┌─────────────────────────────────────────────────────────┐
│  app/          (Presentation — UI, BLoC, pages)           │  ← outermost
├─────────────────────────────────────────────────────────┤
│  data/         (Data sources, repository implementations)│
├─────────────────────────────────────────────────────────┤
│  domain/       (Entities, use cases, repository contracts)│  ← innermost
├─────────────────────────────────────────────────────────┤
│  core/         (DI, failures, routing)                    │
└─────────────────────────────────────────────────────────┘
```

### Layers

| Layer            | Path          | Responsibility                                                                                       |
| ---------------- | ------------- | ---------------------------------------------------------------------------------------------------- |
| **Presentation** | `lib/app/`    | UI (pages/widgets), BLoC (events, state, handlers). Depends on domain (use cases) and core.          |
| **Data**         | `lib/data/`   | Data sources (remote/local) and repository implementations. Implements domain repository interfaces. |
| **Domain**       | `lib/domain/` | Entities, abstract repositories, and use cases. No Flutter or data-layer imports.                    |
| **Core**         | `lib/core/`   | Dependency injection (GetIt), failures, routing (e.g. auto_route). Shared across layers.             |

### Conventions

- **Use cases** – One use case per feature/action; they call repository interfaces and return `Either<Failure, T>` (dartz).
- **Repositories** – Defined in `domain/`, implemented in `data/`. Use cases depend only on the abstract interface.
- **BLoC** – Events/states (e.g. freezed); handlers live in `handlers/` as extensions on the bloc for clearer organization.
- **DI** – Use cases and repositories are registered in `core/injection_container.dart`.

## Project Structure

```
lib/
├── app/                    # Presentation
│   └── pages/
│       └── <feature>/
│           ├── <feature>_page.dart
│           └── bloc/
│               ├── <feature>_bloc.dart
│               ├── <feature>_event.dart
│               ├── <feature>_state.dart
│               └── handlers/
├── core/                   # Shared infrastructure
│   ├── injection_container.dart
│   ├── failure.dart
│   └── autoroutes/
├── data/                   # Data layer
│   ├── datasource/
│   └── repositories/
├── domain/                 # Business logic
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── main.dart
```

## Getting Started

1. **Clone or use this repo** as your project base.
2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Run code generation** (freezed, auto_route)
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
4. **Run the app**
   ```bash
   flutter run
   ```

## Adding a New Feature

1. **Domain**: Add entity(ies), repository abstract class, and use case(s) in `domain/`.
2. **Data**: Add data source(s) and a repository implementation in `data/`.
3. **Core**: Register the new repository and use case in `injection_container.dart`.
4. **Presentation**: Add a page, BLoC (events, state), and handler(s) in `app/pages/<feature>/`, then register the handler in the bloc and add the route if needed.

## Tech Stack

- **State management**: flutter_bloc
- **DI**: get_it
- **Functional error handling**: dartz (`Either<Failure, T>`)
- **Models / events / state**: freezed
- **Routing**: auto_route

## References

- [The Clean Architecture (Uncle Bob)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter documentation](https://docs.flutter.dev/)
