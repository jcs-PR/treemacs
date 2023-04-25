.POSIX:

MAKEFLAGS += k
EASK = eask
EMACS ?= emacs

NO_LOAD_WARNINGS = --eval "(defvar treemacs-no-load-time-warnings t)"
SRC_DIR          = src/elisp
EXTRA_DIR        = src/extra
EMACSFLAGS       = -Q -batch -L $(SRC_DIR) $(NO_LOAD_WARNINGS)
CHECKDOC_COMMAND = -l "test/checkdock.el"
LINT_DIR         = /tmp/treemacs
LINT_FLAG        = --eval "(setq byte-compile-dest-file-function (lambda (f) (concat \"$(LINT_DIR)\" (file-name-nondirectory f) \"c\")))"
TEST_COMMAND     = buttercup -L $(SRC_DIR) -L $(EXTRA_DIR) -L . $(NO_LOAD_WARNINGS)

.PHONY: test compile checkdoc clean lint prepare clean-start .prepare-lint

.ONESHELL:

%.elc: %.el
	@printf "Compiling $<\n"
	$(EASK) compile --strict $<

compile: prepare

.eask: Eask
	@echo Updating external dependencies...
	@$(EASK) install
	@$(EASK) update
	@touch .eask

prepare: .eask

test: prepare
	@$(EASK) exec $(TEST_COMMAND)

clean:
	@$(EASK) clean all

lint: EMACSFLAGS += $(LINT_FLAG)
lint: .prepare-lint compile checkdoc
	@rm -rf $(LINT_DIR)

checkdoc:
	@$(EASK) exec $(EMACS) $(EMACSFLAGS) $(CHECKDOC_COMMAND)

clean-start: prepare
	@$(EASK) test activate

.prepare-lint:
	@rm -rf $(LINT_DIR)
	@mkdir -p $(LINT_DIR)
