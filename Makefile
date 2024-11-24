# Define the image name
IMAGE_NAME = hello-user
DOCKER_USERNAME = bellatang

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the Docker container
run:
	docker run -p 80:80 $(IMAGE_NAME)

# Remove the Docker image
clean:
	docker rmi $(IMAGE_NAME)

image_show:
	docker images

container_show:
	docker ps

push:
	docker login
	docker tag $(IMAGE_NAME) $(DOCKER_USERNAME)/$(IMAGE_NAME)
	docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):latest

login:
	docker login -u ${DOCKER_USERNAME}