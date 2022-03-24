SHELL := /usr/bin/env bash

.PHONY: apply
apply:
	@@$(MAKE) delete || true
	kubectl apply -f job.yaml

.PHONY: delete
delete:
	kubectl delete job nodbox
