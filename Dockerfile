FROM boxcar/raring

MAINTAINER Ike Tohru "ike.tohru@gmail.com"

ENV UWSGICONFIG_LUAPC luajit
#ENV UWSGICONFIG_LUAPC lua5.2

RUN apt-get -y update
RUN apt-get install -y -q software-properties-common
RUN add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN apt-get -y update --fix-missing

RUN apt-get install -y build-essential
RUN apt-get install -y git
RUN apt-get install -y python
RUN apt-get install -y python-dev
RUN apt-get install -y nginx supervisor

RUN apt-get install -y luajit
RUN apt-get install -y libluajit-5.1
RUN apt-get install -y liblua5.1
#RUN apt-get install -y lua5.2
#RUN apt-get install -y liblua5.2

#RUN apt-get install -y curl
#RUN curl -O http://projects.unbit.it/downloads/uwsgi-2.0.3.tar.gz
#RUN tar zxf uwsgi-2.0.3.tar.gz
#RUN cd uwsgi-2.0.3 && python uwsgiconfig.py --plugin --build lua && ln -s uwsgi-2.0.3/uwsgi /usr/local/bin/uwsgi
#or
RUN curl http://uwsgi.it/install | bash -s lua /usr/local/bin/uwsgi

RUN apt-get install -y python-software-properties
RUN apt-get update
RUN add-apt-repository -y ppa:nginx/stable

ADD . /home/docker/code/

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /home/docker/code/nginx-app.conf /etc/nginx/sites-enabled/
RUN ln -s /home/docker/code/supervisor-app.conf /etc/supervisor/conf.d/

EXPOSE 80
CMD ["supervisord", "-n"]
