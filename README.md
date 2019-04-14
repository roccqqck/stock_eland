# stock

### if you want to use my Docker images
###### $ sudo docker pull roccqqck/stock-notebook
###### $ sudo docker run -it -p 8888:8888 --ipc=host roccqqck/stock-notebook jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --notebook-dir='/'
###### or use your Public State IP, for example  140.112.254.4
###### $ sudo docker run -it -p 140.112.254.4:8888:8888 --ipc=host roccqqck/stock-notebook jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --notebook-dir='/'

### if u want to mount a folder from your host computer, adding this -v line like 
###### $ sudo docker run -it -p 140.112.254.4:8888:8888 -v /home/username/projects:/root/projects --ipc=host roccqqck/stock-notebook jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --notebook-dir='/'
