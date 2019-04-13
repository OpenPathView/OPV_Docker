FROM opensfm

RUN mkdir /source/hugin

WORKDIR /source/hugin

RUN apt-get update && apt-get install -y --no-install-recommends wget

RUN wget https://netcologne.dl.sourceforge.net/project/hugin/hugin/hugin-2019.0/hugin-2019.0.0.tar.bz2

RUN tar jxvf hugin-2019.0.0.tar.bz2

WORKDIR /source/hugin/hugin-2019.0.0

RUN apt-get install -y --no-install-recommends swig build-essential autoconf automake1.11 libtool flex bison gdb   libc6-dev libgcc1 cmake pkg-config help2man checkinstall libwxgtk3.0-dev libtiff5-dev libpng-dev libpng16-16 libopenexr-dev libexiv2-dev freeglut3-dev libglew-dev libboost-dev   libboost-thread-dev libboost-regex-dev libboost-filesystem-dev   libboost-iostreams-dev libboost-system-dev libboost-signals-dev   gettext liblapack-dev libxi-dev libxmu-dev libtclap-dev liblensfun-dev libvigraimpex-dev libpano13-dev libimage-exiftool-perl enblend python-argparse libimage-exiftool-perl enblend liblcms2-dev libsqlite3-dev python3-dev && rm -rf /var/lib/apt/lists/*

RUN mkdir hugin.build

WORKDIR /source/hugin/hugin-2019.0.0/hugin.build

RUN cmake ../ -DENABLE_LAPACK=YES -DCPACK_BINARY_DEB:BOOL=ON -DCPACK_BINARY_NSIS:BOOL=OFF  -DCPACK_BINARY_RPM:BOOL=OFF -DCPACK_BINARY_STGZ:BOOL=OFF -DCPACK_BINARY_TBZ2:BOOL=OFF  -DCPACK_BINARY_TGZ:BOOL=OFF -DCPACK_BINARY_TZ:BOOL=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo  -DBUILD_HSI:BOOL=ON -DSWIG_EXECUTABLE=/usr/bin/swig3.0 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6/ -DPYTHON_LIBRARY=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/libpython3.6.so -DPYTHON_EXECUTABLE=/usr/bin/python3.6

RUN make -j8

RUN make install

WORKDIR /

RUN rm -rf /source/hugin
