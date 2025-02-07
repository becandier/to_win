# Makefile
ifneq (,$(wildcard .env))
  include .env
  export
endif

# ANSI code for blue text
BLUE = \033[0;34m
NC = \033[0m # No Color

gen:
	flutter pub run build_runner build --delete-conflicting-outputs

loc:
	flutter gen-l10n

upload:
	@echo "$(BLUE)Проверьте включен ли у вас VPN и актуален ли код версии!$(NC)"
	xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey $(KEY_ID) --apiIssuer $(API_ISSUER)

testfl:
	@echo "$(BLUE)Проверьте включен ли у вас VPN и актуален ли код версии!$(NC)"
	flutter clean
	flutter pub get
	flutter build ipa
	xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey $(KEY_ID) --apiIssuer $(API_ISSUER)

release:
	@echo "$(BLUE)Проверьте включен ли у вас VPN и актуален ли код версии!$(NC)"
	flutter clean
	flutter pub get
	flutter build ipa
	xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey $(KEY_ID) --apiIssuer $(API_ISSUER)
	flutter build appbundle
debug:
	@echo "$(BLUE)Проверьте включен ли у вас VPN и актуален ли код версии!$(NC)"
	flutter clean
	flutter pub get
	flutter build ipa
	xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey $(KEY_ID) --apiIssuer $(API_ISSUER)
	flutter build apk
	
