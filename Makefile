IMAGE=njavilas/n8n-runner

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)