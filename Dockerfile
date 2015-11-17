# Dockerfile to create a container running HEASoft 6.17

FROM ubuntu:15.10

MAINTAINER ldouchy

LABEL version="0.3" HEASoft_version="6.17" description="HEASoft software https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/"

ENV CC=/usr/bin/gcc \
    CXX=/usr/bin/g++ \
    FC=/usr/bin/gfortran \
    PERL=/usr/bin/perl \
    PYTHON=/usr/bin/python \
    HEADAS=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0 \
    XANBIN=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0 \
    PERL5LIB=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/lib/perl \
    LHEAPERL=/usr/bin/perl \
    PGPLOT_RGB=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/lib/rgb.txt \
    PGPLOT_FONT=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/lib/grfont.dat \
    FTOOLS=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0 \
    EXT=lnx \
    FTOOLSINPUT=stdin \
    LD_LIBRARY_PATH=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/lib \
    PFILES=/root/pfiles;/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/syspfiles \
    LHEASOFT=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0 \
    LHEA_HELP=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/help \
    PATH=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    XRDEFAULTS=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/xrdefaults \
    LHEA_DATA=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/refdata \
    FTOOLSOUTPUT=stdout \
    PERLLIB=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/lib/perl \
    XANADU=/opt/heasoft \
    PFCLOBBER=1 \
    POW_LIBRARY=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/lib/pow \
    PGPLOT_DIR=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/lib \
    PYTHONPATH=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/lib/python:/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/lib \
    TCLRL_LIBDIR=/opt/heasoft/x86_64-unknown-linux-gnu-libc2.21-0/lib

# Install HEASoft prerequisites

RUN apt-get update && \
    apt-get install -y \
	gcc \
	gfortran \
	g++ \
	libncurses5-dev \
	libreadline6-dev \
	ncurses-dev \
	perl-modules \
	python-dev \
	wget \
	xorg-dev \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /opt/

# copy the file heasoft-6.17src.tar.gz
#COPY heasoft-6.17src.tar.gz /opt/
# Uncompress the HEASoft
#RUN tar xzvf /opt/heasoft-6.17src.tar.gz

# Or fresh download + auto  uncompress
RUN wget /heasarc.gsfc.nasa.gov/FTP/software/lheasoft/lheasoft6.17/heasoft-6.17src.tar.gz 

# execute install script

RUN cd /opt/heasoft-6.17/BUILD_DIR/ && ./configure --prefix=/opt/heasoft/ 2>&1 | tee /opt/config.out && make 2>&1 | tee /opt/build.log && make install 2>&1 | tee /opt/install.log && rm -rf /opt/heasoft-6.17*

# Simple test
# In most other cases, CMD should be given an interactive shell
CMD fhelp xspec
