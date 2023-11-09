# include ../../../make.inc

# Build docker image
build_docker_image:
	docker build -t ${DOCKER_IMAGE_NAME} --build-arg PORT={PORT} .

# Run docker image interactively
run_docker_image:
	docker run --rm -it -p 8000:${PORT} -e PORT=${PORT} ${DOCKER_IMAGE_NAME}

# Push docker image
push_docker_image:
	docker push ${DOCKER_IMAGE_NAME}

# deploy Docker image on Google Cloud Run
deploy_docker_image:
	gcloud run deploy fast-app \
	--image ${DOCKER_IMAGE_NAME} \
	--region=europe-west1 \
	--allow-unauthenticated
