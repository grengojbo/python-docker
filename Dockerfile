# Python server host
#
# VERSION               0.1.3

FROM  grengojbo/base:latest
MAINTAINER Oleg Dolya "oleg.dolya@gmail.com"

RUN apt-get update && apt-get install -y \
        autoconf \
        build-essential \
        imagemagick \
        libbz2-dev \
        libcurl4-openssl-dev \
        libevent-dev \
        libffi-dev \
        libglib2.0-dev \
        libjpeg-dev \
        libmagickcore-dev \
        libmagickwand-dev \
        libmysqlclient-dev \
        libncurses-dev \
        libpq-dev \
        libpq-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        libxml2-dev \
        libxslt-dev \
        zlib1g-dev \
        bzr \
        cvs \
        git \
        mercurial \
        subversion bison ssh psmisc procps \
        python python-cjson python-dev python-lxml gdal-bin libevent-dev libfreetype6 \
        libfreetype6-dev libgeos-dev libjpeg8 libplist-utils libproj-dev libtiff4-dev \
        libjpeg8-dev liblcms1-dev libwebp-dev python-setuptools python-mako python-gevent python-mysqldb \
        --no-install-recommends && apt-get -y autoremove && apt-get -y autoclean && apt-get -y clean

RUN ln -s /usr/lib/x86_64-linux-gnu/libz.so /usr/lib/
RUN ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib/
RUN ln -s /usr/lib/x86_64-linux-gnu/libfreetype.so /usr/lib/
RUN easy_install pip
RUN pip install -U distribute
RUN pip install gevent
RUN pip install gunicorn
RUN pip install mysql-python
RUN pip install Pillow

#ADD .synergy.conf /root/.synergy.conf
#ADD .tmux.conf /root/.tmux.conf

# Sharing sshd port to host
#EXPOSE 22

#CMD ["/usr/sbin/sshd", "-D"]

#RUN mkdir -p /home/dev
#RUN chown -R dev.www-data /home/dev
#USER user
#ADD .ackrc /home/dev/.ackrc
#ADD .bash_aliases /home/dev/.bash_aliases
#ADD .gitconfig /home/dev/.gitconfig
#ADD .hgrc /home/dev/.hgrc
#ADD .synergy.conf /home/dev/.synergy.conf
#ADD .tmux.conf /home/dev/.tmux.conf

# Preconfigure for sshd
#RUN mkdir /var/run/sshd 
#RUN chown root.root /var/run/sshd
#RUN chmod 755 /var/run/sshd
#RUN mkdir /root/.ssh

#ADD sudodev /etc/sudoers.d/dev
#RUN chown root.root /etc/sudoers.d/dev
#RUN chmod 440 /etc/sudoers.d/dev

# Adding public key
#ADD docker.pub /root/.ssh/authorized_keys
#RUN chown -R root.root /root/.ssh/
#RUN chmod 700 /root/.ssh/

#RUN useradd -g www-data dev
#RUN usermod -a -G sudo dev
#RUN mkdir -p /usr/src/app
##WORKDIR /usr/src/app
#RUN chown -R dev:users .

# Configuring timezone
#RUN cp /usr/share/zoneinfo/Europe/Kiev /etc/localtime
