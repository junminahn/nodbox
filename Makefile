.PHONY: getnext changelog-unrelease changelog changelog-latest release apply delete

SEMTAG=semtag

CHANGELOG_FILE = CHANGELOG.md

scope ?= "minor"
nextver = `$(SEMTAG) final -s $(scope) -o -f`

changelog_unrelease:
	@git-chglog --no-case -o $(CHANGELOG_FILE)

changelog_next:
	@git-chglog --no-case -o $(CHANGELOG_FILE) --next-tag $(nextver)

changelog_latest:
	@git-chglog --no-case -o $(CHANGELOG_FILE) `$(SEMTAG) getlast`

release:
	@$(SEMTAG) final -s $(scope)

bump_next_version:
	@npm version $(nextver) --no-git-tag-version --allow-same-version

apply:
	@@$(MAKE) delete || true
	kubectl apply -f job.yaml

delete:
	kubectl delete job nodbox
