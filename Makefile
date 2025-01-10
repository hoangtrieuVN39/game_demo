.DEFAULT_GOAL := setup

.PHONY: init
init: ## install flutter
	$(MAKE) install

.PHONY: setup
setup: ## `flutter clean` and `flutter pub get`
	$(MAKE) clean
	$(MAKE) pub-get
	$(MAKE) build

.PHONY: install
install: ## asdf install
	$(info $(SEPARATOR))
	asdf install

.PHONY: clean
clean: ## flutter clean
	$(info $(SEPARATOR))
	flutter clean

.PHONY: pub-get
pub-get: ## flutter pub get
	$(info $(SEPARATOR))
	flutter pub get

.PHONY: run
run: ## flutter run
	$(info $(SEPARATOR))
	flutter run

.PHONY: pod-install
pod-install: ## pod install
	$(info $(SEPARATOR))
	cd ios && pod install

.PHONY: oc # oc = operation-check
oc: ## Run operation check including flutter clean, pub get, pod install, and make run
	$(MAKE) clean
	$(MAKE) pub-get
	$(MAKE) pod-install
	$(MAKE) run

.PHONY: build
build: ## flutter pub run build_runner build
	$(info $(SEPARATOR))
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: clean-build
clean-build: ## flutter pub run build_runner clean, flutter pub run build_runner build
	$(info $(SEPARATOR))
	flutter pub run build_runner clean
	flutter pub run build_runner build --delete-conflicting-outputs

SEPARATOR=********************