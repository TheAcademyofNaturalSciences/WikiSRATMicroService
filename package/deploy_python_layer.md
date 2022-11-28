#### In order to create a Lambda Layer, you must be using a linux system
#### So, this process is Dockerized
#### Refer to files in ./package (Dockerfile, requirements.txt, docker_install.sh, runner.sh)
#### code source: https://www.youtube.com/watch?v=jXjMrWCpaI8&ab_channel=FelixYu
#### Make sure you have Docker Desktop installed (Windows, Mac) and that it is running
#### Update ./package requirements.txt as necessary

#### RUN IN UBUNTU SUBSYSTEM (ON WINDOWS) OR FROM MAC TERMINAL
```
cd packages
docker build -f Dockerfile . -t aws_lamda_builder_image
./runner.sh
```

#### Running this code should produce ./python.zip
#### Upload this python.zip file as a new version of the wikisrat layer


   












