FROM centos:6

WORKDIR /usr/local
COPY . /usr/local/inception/
RUN yum -y install wget cmake ncurses-devel openssl-devel gcc-c++ make m4 perl-devel \
	&& cd /usr/local && wget http://ftp.gnu.org/gnu/bison/bison-2.6.5.tar.gz \
	&& cd /usr/local && tar xf bison-2.6.5.tar.gz \
	&& cd bison-2.6.5 && ./configure && make && make install \
	&& cd /usr/local/inception && ./inception_build.sh debug \
	&& yum remove gcc=c++ make m4 perl-devel && rm bison-2.6.5 bison-2.6.5.tar.gz  -rf


EXPOSE 6669
CMD /usr/local/inception/debug/mysql/bin/Inception --port 6669	
