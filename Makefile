PREFIX   ?= /usr/local
BINDIR    = $(PREFIX)/bin
MANDIR    = $(PREFIX)/share/man/man1
NAME			= jackitng

INSTALL       = install
INSTALL_BIN   = $(INSTALL) -m 0755
INSTALL_MAN   = $(INSTALL) -m 0644
MKDIR_P       = mkdir -p

BIN_SRC   = bin/$(NAME)
MAN_SRC   = documentation/$(NAME).1

.PHONY: all requirements install uninstall clean

all:
	@echo "Nothing to build. Use 'make install'."

requirements:
	@echo "Installing JackitNG requirements..."
	pip install -r requirements.txt
	pip install -e .

install:
	@echo "Installing JackitNG to $(PREFIX)..."

	# Create directories
	$(MKDIR_P) $(BINDIR)
	$(MKDIR_P) $(MANDIR)

	# Install binary
	$(INSTALL_BIN) $(BIN_SRC) $(BINDIR)/$(NAME)

	# Install man page
	$(INSTALL_MAN) $(MAN_SRC) $(MANDIR)/$(NAME).1
	mandb

	@echo "Install complete."

uninstall:
	@echo "Removing JackitNG from $(PREFIX)..."
	rm -f $(BINDIR)/$(NAME)
	rm -f $(MANDIR)/$(NAME).1*
	@echo "Uninstall complete."

clean:
	@echo "Nothing to clean."

