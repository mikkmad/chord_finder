## Architecture Overview

This application organizes code following Flutter community conventions for maintainability and scalability.

### Directory Layout

The `lib/` folder contains the following structure:

**User Interface Layer (`ui/`)**
- `pages/` - Contains full-screen views including welcome screen, chord explorer, chord finder, scale browser, favorites collection, and notes reference
- `widgets/` - Houses reusable components like the fretboard visualization canvas
- `themes/` - Manages application styling and theming configuration

**Data Layer (`data/`)**
- `models/` - Defines data structures for musical entities (chords, scales, notes)
- `repositories/` - Implements data retrieval and storage logic
- `services/` - Provides database connectivity and external integrations

**Utilities (`utils/`)**
- Contains helper classes and functions, including fretboard layout generation