# Sample usage for help.mk

include help.mk

#_# foo: A top-level target
#_#
foo:
	echo this is foo

#_# bar: A top-level target with additional help
#_#      All of the help comments are included in the output
#_#
bar:
	echo this is bar

#_# baz: Another top-level target
#_#      Makefile names are printed without indentation
#_#      The #_# prefix is replaced by a single space
#_#      No additional formatting is done
#_#      Aligned input produces aligned output
#_#
baz:
	echo this is baz

.PHONY: tests

#_# tests
#_#   Run test suite and diff with expected results
#_#
tests:
	rm -f tests/output
	tests/run > tests/output
	diff tests/output tests/expected

include Makefile.sub
# Test filename exclusion
include mktest/Makefile.bsd.mk
include mktest/Makefile.gnu.mk

