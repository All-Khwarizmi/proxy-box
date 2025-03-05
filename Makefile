.PHONY: install

install:
	forge install OpenZeppelin/openzeppelin-contracts-upgradeable && forge install OpenZeppelin/openzeppelin-contracts && forge install foundry-rs/forge-std && forge install cyfrin/foundry-devops

remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"
