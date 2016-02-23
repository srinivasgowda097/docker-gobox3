FROM    centos:6
RUN	yum -y update
RUN 	yum -y install gcc glibc-devel
RUN	yum -y install tar
RUN	yum -y install wget
RUN	yum -y install git
RUN	yum -y install http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
RUN	yum -y install golang
RUN	yum -y localinstall http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
RUN	yum -y install apr-devel apr-util-devel
RUN	yum -y install mod_dav_svn subversion
RUN	yum -y --disablerepo=base,updates --enablerepo=rpmforge-extras update git
RUN	mkdir /root/gocode
ENV 	HOME /root
ENV 	GOPATH $HOME/gocode  
ENV 	PATH $HOME/gocode/bin:$PATH
RUN	go get -v gopkg.in/fsnotify.v1
RUN 	go get -v github.com/revel/revel
RUN	go get -v github.com/revel/cmd/revel
RUN	go get -v github.com/revel/modules/static/app/controllers
RUN	go get -v github.com/claytantor/myrevelapp/app
EXPOSE	80
CMD	["revel","run","github.com/claytantor/myrevelapp"]

