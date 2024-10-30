
#_# help: Display this helpful message

MAKE_TYPE != test -n "$(MAKEFILE_LIST)" && echo gnu || echo bsd

include help.$(MAKE_TYPE).mk

