
all:
	docker build -f Dockerfile.base -t bardelch/jetscapesims:base .
	docker build --no-cache -t bardelch/jetscapesims .

shell:
	docker run -p 8501:8501 -it bardelch/jetscapesims /bin/bash

push:
	docker push bardelch/jetscapesims:base
	docker push bardelch/jetscapesims
