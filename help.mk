#_# help: Display this helpful message
_HELP_TYPE != test -n "$(MAKEFILE_LIST)" && echo '$(dir $(lastword $(MAKEFILE_LIST)))help.gnu.mk' || echo help.bsd.mk
include $(_HELP_TYPE)
