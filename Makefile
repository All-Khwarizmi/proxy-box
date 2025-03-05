.PHONY: install

install:
	forge install OpenZeppelin/openzeppelin-contracts-upgradeable

remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"
