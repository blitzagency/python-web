FROM blitzagency/python-web:2

ENV GEOS_VERSION 3.5.0
ENV PROJ4_VERSION 4.9.2
ENV GDAL_VERSION 2.0.1

RUN apk --update --no-cache add autoconf automake libtool json-c-dev libxml2-dev && \
    mkdir -p /tmp/build && cd /tmp/build && \
    wget -O geos-${GEOS_VERSION}.tar.gz https://github.com/libgeos/libgeos/archive/${GEOS_VERSION}.tar.gz && \
    wget -O proj4-${PROJ4_VERSION}.tar.gz https://github.com/OSGeo/proj.4/archive/${PROJ4_VERSION}.tar.gz && \
    wget -O gdal-${GDAL_VERSION}.tar.gz http://download.osgeo.org/gdal/2.0.1/gdal-${GDAL_VERSION}.tar.gz && \
    tar xzf proj4-${PROJ4_VERSION}.tar.gz && \
    tar xzf geos-${GEOS_VERSION}.tar.gz && \
    tar xzf gdal-${GDAL_VERSION}.tar.gz && \
    cd proj.4* && ./configure --enable-silent-rules && make -s && make -s install && \
    cd ../libgeos* && ./autogen.sh && ./configure --enable-silent-rules CFLAGS="-D__sun -D__GNUC__"  CXXFLAGS="-D__GNUC___ -D__sun" && make -s && make -s install && \
    cd ../gdal* && ./configure --enable-silent-rules --with-static-proj4=/usr/local/lib && make -s && make -s install && \
    apk del autoconf automake libtool --force && \
    rm -rf /tmp/build
