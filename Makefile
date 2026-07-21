# Homelab stack management.
# Each service is its own docker compose stack in a subdirectory; targets
# discover every docker-compose.yml present on this host and act on all of them.
#
# Excluding stacks on a given host:
#   * Persistent: list stack dirs (one per line) in .stackignore
#   * One-off:    make up EXCLUDE="immich torrent"
# Exclusions are prefix-aware, so "immich" skips immich/server, immich/kiosk, etc.

EXCLUDE ?=
EXCLUDE_FILE := .stackignore
EXCLUDES := $(EXCLUDE) $(if $(wildcard $(EXCLUDE_FILE)),$(shell grep -vE '^[[:space:]]*(#|$$)' $(EXCLUDE_FILE)))

# Discover stacks and normalize to bare dir paths (no leading ./, no trailing /).
ALL_STACKS := $(patsubst ./%,%,$(patsubst %/,%,$(dir $(shell find . -name docker-compose.yml | sort))))

# A stack is excluded if it equals, or is nested under, any exclude entry.
is_excluded = $(strip $(foreach e,$(EXCLUDES),$(if $(filter $(e) $(e)/%,$(1)),x)))
STACKS := $(foreach s,$(ALL_STACKS),$(if $(call is_excluded,$(s)),,$(s)))

.PHONY: up down restart pull ps logs list

up: ## Start all stacks
	@for d in $(STACKS); do echo "==> up: $$d"; (cd "$$d" && docker compose up -d) || exit $$?; done

down: ## Stop and remove all stacks
	@for d in $(STACKS); do echo "==> down: $$d"; (cd "$$d" && docker compose down) || exit $$?; done

restart: down up ## Restart all stacks

pull: ## Pull latest images for all stacks
	@for d in $(STACKS); do echo "==> pull: $$d"; (cd "$$d" && docker compose pull) || exit $$?; done

ps: ## Show status of all stacks
	@for d in $(STACKS); do echo "==> ps: $$d"; (cd "$$d" && docker compose ps); done

logs: ## Tail logs for all stacks
	@for d in $(STACKS); do echo "==> logs: $$d"; (cd "$$d" && docker compose logs --tail=50); done

list: ## Print the stacks that will be acted on
	@for d in $(STACKS); do echo "$$d"; done
