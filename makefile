# docker-compose command
up:
	@docker-compose up -d
down:
	@docker-compose down
reload:
	@docker-compose down
	@docker-compose up -d
rebuild:
	@rm -rf src
	@docker-compose down
	@docker-compose rm 
	@docker-compose build --no-cache
	@docker-compose up -d 
exec:
	@docker-compose exec web /bin/bash

# setup command after container has built
clone:
	@git clone https://github.com/anandpawara/Real_Time_Image_Animation.git ./src
	@docker-compose exec web virtualenv env
	@(cd ./src && source env/bin/activate)
	@docker-compose exec web pip3 install -r requirements.txt
install_pip:
	@docker-compose exec web pip3 install torch===1.8.0 torchvision -f https://download.pytorch.org/whl/cu100/torch_stable.html
	@docker-compose exec web pip3 install imageio scikit-image scikit-learn pandas matplotlib pyyaml opencv-python
install_model:
	@docker-compose exec web gdown --id 1wCzJP1XJNB04vEORZvPjNz6drkXm5AUK
	@docker-compose exec web unzip checkpoints.zip -d ./extract
	@docker-compose exec web rm checkpoints.zip

# run command for python
run_camera:
	@docker-compose exec python3 ./image_animation.py -i ./Inputs/feynman.jpeg -c ./extract/real_time_model/vox-adv-cpk.pth.tar
run_file:
	@docker-compose exec python3 ./image_animation.py -i ./Inputs/feynman.jpeg -c ./extract/real_time_model/vox-adv-cpk.pth.tar -v video.mp4
