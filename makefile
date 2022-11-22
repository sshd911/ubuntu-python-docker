up:
	@docker-compose up -d
down:
	@docker-compose down
reload:
	@docker-compose down
	@docker-compose up -d
rebuild:
	@docker-compose down
	@docker-compose rm web
	@docker-compose up -d --build web

exec:
	docker-compose exec web /bin/bash

install:
	docker-compose exec web /bin/bash; \
	cd src; \
	git clone https://github.com/anandpawara/Real_Time_Image_Animation.git . 1> /dev/null; \
	pip3 install virtualenv gdown 1> /dev/null; \
	virtualenv env 1> /dev/null; \
	source env/bin/activate 1> /dev/null; \
	pip3 install -r requirements.txt 1> /dev/null; \
	pip3 install torch===1.13.0 torchvision -f https://download.pytorch.org/whl/cu100/torch_stable.html 1> /dev/null; \
	pip3 install imageio scikit-image scikit-learn pandas matplotlib pyyaml opencv-python 1> /dev/null;