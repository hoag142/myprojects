FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

# Install software packages inside the container
RUN apt-get update && \
	apt-get -y install \  
#	iputils-ping \ 
	zsh \
	nasm \
	gcc \
 	gcc-multilib \
	gdb \
	python \
#	git \  
    	nano && \
	apt-get clean

# Put file inside the container
RUN useradd -m -s /bin/bash seed && \
	echo "root:dees" | chpasswd && \
	echo "seed:dees" | chpasswd && \
	usermod -aG sudo seed  

USER seed
WORKDIR /home/seed
#RUN mkdir asm
RUN mkdir seclabs
RUN git clone https://github.com/longld/peda.git ~/peda
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit

# The command executed by the container after startup
CMD [ "/bin/bash"]

