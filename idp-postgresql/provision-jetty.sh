#!/usr/bin/env bash

JETTY_VERSION=9.3.8.v20160314
JETTY_HOME=/opt/jetty
TARBALL=/tmp/jetty-dist.tar.gz

echo "Downloading: http://mirror.cc.columbia.edu/pub/software/eclipse/jetty/$JETTY_VERSION/dist/jetty-distribution-${JETTY_VERSION}.tar.gz"
curl -sL -fo $TARBALL http://mirror.cc.columbia.edu/pub/software/eclipse/jetty/$JETTY_VERSION/dist/jetty-distribution-${JETTY_VERSION}.tar.gz 
if   [ "$?" -ne "0"  ]; then echo "Download failed, Aborting." 1>&2 ; exit -1  ; fi

pushd /tmp; tar -zxf $TARBALL; popd
mv /tmp/jetty-distribution-${JETTY_VERSION} $JETTY_HOME

# File permissions
chown -R vagrant:vagrant $JETTY_HOME

# Configure shell environment
BASHRC=/home/vagrant/.bashrc
echo >> $BASHRC
echo "# Jetty environment " >> $BASHRC
echo "export JETTY_HOME=\"$JETTY_HOME\"" >> $BASHRC
echo 'export PATH="$JETTY_HOME"/bin:$PATH' >> $BASHRC

