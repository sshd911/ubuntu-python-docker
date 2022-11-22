up:
	@docker-compose up -d

down:
	@docker-compose down

reload:
	@docker-compose down
	@docker-compose up -d

rebuild:
	@docker-compose down
	@docker-compose rm 
	@docker-compose build --no-cache
	@docker-compose up -d 

exec:
	@docker-compose exec web /bin/bash

install:
	@docker-compose exec web git clone https://github.com/anandpawara/Real_Time_Image_Animation.git;
	@docker-compose exec web virtualenv env;
	@docker-compose exec web source env/bin/activate;
	@docker-compose exec web pip3 install -r requirements.txt;
	@docker-compose exec web pip3 install torch===1.13.0 torchvision -f https://download.pytorch.org/whl/cu100/torch_stable.html;
	@docker-compose exec web pip3 install imageio scikit-image scikit-learn pandas matplotlib pyyaml opencv-python;

install_model:
	@docker-compose exec web gdown --id 1wCzJP1XJNB04vEORZvPjNz6drkXm5AUK;
	@docker-compose exec web unzip checkpoints.zip -d ./extract;
	@docker-compose exec web rm checkpoints.zip;
