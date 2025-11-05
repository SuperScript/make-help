# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is **make-help**, a lightweight utility for adding self-documenting help to Makefiles. It works with both GNU Make and BSD Make by detecting which Make variant is available and including the appropriate implementation.

## Key Architecture

The system has a clever cross-platform design:

1. **help.mk** - Entry point that auto-detects GNU Make vs BSD Make using shell test
2. **help.gnu.mk** - GNU Make implementation using `$(MAKEFILE_LIST)`
3. **help.bsd.mk** - BSD Make implementation using `$(.MAKE.MAKEFILES)`

Both implementations:
- Extract `#_#` comments from Makefiles using `sed -n 's/^#_#/ /p'`
- Filter out system files and implementation files (*.bsd.mk, *.gnu.mk, /usr/share/mk/*)
- Display Makefile names followed by extracted help text

## Documentation Convention

Target documentation uses `#_#` prefix:
```makefile
#_# target-name: Description
#_#              Additional lines with preserved indentation
target-name:
    commands
```

The `#_#` prefix is replaced with a single space in output, and all formatting/indentation is preserved.

## Common Commands

**View all documented targets:**
```bash
make help
# or just
make
```

**Run test suite:**
```bash
make tests
```

This runs `tests/run` (which executes `make help`) and diffs the output against `tests/expected`.

## File Exclusion Logic

The help system intentionally excludes:
- `*.bsd.mk` and `*.gnu.mk` files (implementation files)
- `/usr/share/mk/*` (BSD system Makefiles)
- Files already processed (GNU Make tracks this separately)

This exclusion logic is tested via the `mktest/` directory which contains dummy Makefiles that should not appear in help output.

## Testing

The test harness is minimal:
- `tests/run` executes `make help`
- Output is compared against `tests/expected`
- Any diff indicates a regression

When modifying help output format, update `tests/expected` accordingly.
