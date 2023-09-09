#### Start of standard makefile configuration. ####

SHELL := /usr/bin/env bash
LN_S := ln -sf

# Root of the installation
prefix := /usr/local

# Root of the executables
exec_prefix := $(prefix)

# Executables
bindir := $(exec_prefix)/bin

# Set space as the recipe prefix, instead of tab
# Note: It also works with multiple spaces before the recipe text
empty :=
space := $(empty) $(empty)
.RECIPEPREFIX := $(space) $(space)

# Enable delete on error, which is disabled by default for legacy reasons
.DELETE_ON_ERROR:

#### End of standard makefile configuration. ####

# Project specific absolute path
srcdir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

green := \\e[32m
blue := \\e[34m
bold := \\e[1m
reset := \\e[0m

.PHONY: all
all: install

.PHONY: install
install: installdirs
  @echo -e $(blue)Installing ...$(reset)
  @$(LN_S) $(srcdir)/yas-bdsm $(DESTDIR)$(bindir)/yas-bdsm
  @echo -e '   'Installing $(green)yas-bdsm$(reset) in $(green)$(DESTDIR)$(bindir)/$(reset)$(bold)yas-bdsm$(reset)
  @echo -e $(blue)Installing$(reset) $(green)DONE$(reset)

.PHONY: installdirs
installdirs:
  @echo -e $(blue)Creating directories ...$(reset)
  @mkdir -p $(DESTDIR)$(bindir)
  @echo -e '   'Creating directory $(green)$(DESTDIR)$(bindir)$(reset)
  @echo -e $(blue)Creating directories$(reset) $(green)DONE$(reset)\\n

.PHONY: uninstall
uninstall:
  @echo -e $(blue)Uninstalling ...$(reset)
  @rm -f $(DESTDIR)$(bindir)/yas-bdsm
  @echo -e '   'Deleting file $(green)yas-bdsm$(reset) in $(green)$(DESTDIR)$(bindir)/$(reset)$(bold)yas-bdsm$(reset)
  @echo -e $(green)Uninstalling DONE$(reset)
