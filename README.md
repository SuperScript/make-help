# make-help

A simple and elegant way to add self-documenting help to your Makefiles. Works with both GNU Make and BSD Make.

## Overview

make-help lets you document your Makefile targets directly in the source using special comments. These comments are automatically extracted and displayed when running `make` with no arguments or `make help`.

## Usage

Just run `make` to see how it works! Including `make.mk` at the top of your main Makefile means the default target will show documentation for all targets in your project.

Add help text to your Makefiles using `#_#` comments for your targets:

```makefile
#_# mytarget: Description of what this target does
#_#           Additional details can go on multiple lines
#_#           Indentation is preserved
mytarget:
    command here
```

## Features

- Works with both GNU Make and BSD Make automatically
- Supports multi-line help text with preserved formatting
- Works across included Makefiles
- Skips system includes and help system files
- Simple and lightweight implementation
- Easy to integrate into existing projects

## Installation

1. Copy these files to your project:
   - help.mk
   - help.gnu.mk
   - help.bsd.mk

2. Add this line before other targets in your Makefile:
```makefile
include help.mk
```

That's it! Now running `make` will show help for all documented targets.

## Example

The included example Makefile demonstrates the features:

```makefile
#_# foo: A top-level target
foo:
    echo this is foo

#_# bar: A top-level target with additional help
#_#      All of the help comments are included in the output
bar:
    echo this is bar
```

Running `make` will display the documentation for all targets.

## Public Domain

This project is released into the public domain. Feel free to use it however you like!

## Contributing

Feel free to open issues or submit pull requests on GitHub.

