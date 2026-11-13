include ../../../make.inc

# YOUR CODE HERE
build_docker_image:
	docker build -t ${DOCKER_IMAGE_NAME} .

run_docker_image:
	docker run --rm -it -p ${PORT}:${PORT} -e PORT=${PORT} ${DOCKER_IMAGE_NAME}

push_docker_image:
	docker push ${DOCKER_IMAGE_NAME}

deploy_docker_image:
	gcloud run deploy nonroot-image-fastapi \
		--image="${DOCKER_IMAGE_NAME}" \
		--region="${LOCATION}" \
		--port="${PORT}" \
		--allow-unauthenticated
