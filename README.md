### use my Docker images
[https://hub.docker.com/r/roccqqck/stock-notebook](https://hub.docker.com/r/roccqqck/stock-notebook)
`````` 
sudo docker pull roccqqck/stock-notebook
sudo docker run -it -p 0.0.0.0:8889:8888 roccqqck/stock-notebook \
   jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='password' --notebook-dir='/'
``````
#### use your remote server Public Static IP, for example  http://140.112.254.4:8889 or http://localhost:8889



### mount a folder from your host computer, adding -v /HOST/PATH:/DOCKER/PATH 
`````` 
sudo docker run -it -p 0.0.0.0:8889:8888 -v /home/username/projects:/root/projects \
   roccqqck/stock-notebook \
   jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='password' --notebook-dir='/'
``````


### use my conda environment(linux). Download this
https://anaconda.org/roccqqck/stockenv/2019.09.27.072225/download/stockenv.cpu.gpu.environment.yml
```
conda env create -f stockenv.cpu.gpu.environment.yml
conda activate stockenv
```
