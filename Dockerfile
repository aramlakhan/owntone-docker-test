FROM ubuntu:20.04

#Ok let's install dependcies 
RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential git autotools-dev autoconf automake libtool gettext gawk && \
    apt-get install --no-install-recommends -y gperf antlr3 libantlr3c-dev libconfuse-dev libunistring-dev libsqlite3-dev && \
    apt-get install --no-install-recommends -y libavcodec-dev libavformat-dev libavfilter-dev libswscale-dev libavutil-dev && \
    apt-get install --no-install-recommends -y libasound2-dev libmxml-dev libgcrypt20-dev libavahi-client-dev zlib1g-dev && \
    apt-get install --no-install-recommends -y libevent-dev libplist-dev libsodium-dev libjson-c-dev libwebsockets-dev && \
    apt-get install --no-install-recommends -y libcurl4-openssl-dev libprotobuf-c-dev && \
    
#Build Sqlite3
    mkdir /tmp/Sqlite3 && \
    curl -sSL https://sqlite.org/2021/sqlite-autoconf-3360000.tar.gz | tar xzC /tmp/Sqlite3 && \

#Build OwnTone Server    
    mkdir /tmp/owntone && \
    curl -sSL https://github.com/owntone/owntone-server/releases/download/28.1/owntone-28.1.tar.xz | tar xzC /tmp/owntone && \
    cd /tmp/owntone/*owntone* && \
    autoreconf -i && \
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var && \
    make && \
    make install && \

    
    
    
    
    
    
    
    
    
    && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["mysql"]