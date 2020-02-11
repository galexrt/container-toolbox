RELEASE_TAG ?= v$(shell date +%Y%m%d)

build:
	docker build -t galexrt/container-toolbox:latest .

release:
	git tag $(RELEASE_TAG)
	git push origin $(RELEASE_TAG)

release-and-build: build
	git tag $(RELEASE_TAG)
	docker tag galexrt/container-toolbox:latest galexrt/container-toolbox:$(RELEASE_TAG)
	git push origin $(RELEASE_TAG)
	docker push galexrt/container-toolbox:$(RELEASE_TAG)
	docker push galexrt/container-toolbox:latest
