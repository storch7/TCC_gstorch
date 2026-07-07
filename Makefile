COMPOSE = docker compose

.PHONY: docker-build build-pdf build-clean clean


build-clean: build-pdf clean

build-pdf: latex
	rm -f TCC_Guilherme_Storch.pdf
	$(COMPOSE) up
	cp latex/TCC_Guilherme_Storch.pdf TCC_Guilherme_Storch.pdf 

clean:
		$(COMPOSE) run latex bash -c 'make clean'

docker-build: docker-compose.yml Dockerfile 
	$(COMPOSE) build latex