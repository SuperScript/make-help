# Sample usage for help.mk

include help.mk

#_# foo: A top-level target
foo:
	echo this is foo

#_# bar: A top-level target with additional help
#_#      All of the help comments are included in the output
bar:
	echo this is bar

#_# baz: Another top-level target
#_#      Makefile names are printed without indentation
#_#      The #_# prefix is replaced by a single space
#_#      No additional formatting is done
#_#      Aligned input produces aligned output
baz:
	echo this is baz

include Makefile.sub

