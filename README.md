# tensorflow-docker
A simple docker container that shows how to install Tensorflow in a docker container. 


https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker/Dockerfile

## Clone the repository
Clone this repo from github and enter that directory.

```
git clone https://github.com/ddahlmeier/tensorflow-docker.git
cd tensorflow-docker
```


## Run Tensorflow with Docker
You need to have Docker installed on your system (https://docs.docker.com/engine/getstarted).

Build the Docker container.

```
docker build -t tensorflow-docker .
```

Start the docker container. 

```
docker run -p 0.0.0.0:8888:8888 -it tensorflow-docker
[I 10:44:46.418 NotebookApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret
[I 10:44:46.544 NotebookApp] Serving notebooks from local directory: /notebooks
[I 10:44:46.544 NotebookApp] 0 active kernels 
[I 10:44:46.544 NotebookApp] The Jupyter Notebook is running at: http://[all ip addresses on your system]:8888/?token=ef79794abe5ad8259148074e62acf3f097e18234fed085d0
[I 10:44:46.544 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
```

The container starts a jupyter notebook. Open your browser and
navigate to the URL shown in the docker logs, e.g., **http://[ip addresses on your system]:8888/?token=ef79794abe5ad8259148074e62acf3f097e18234fed085d0** in the example above.
