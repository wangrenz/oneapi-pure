FROM ubuntu:20.04


ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
RUN apt-get update -y && \
    apt-get install -y vim openssh-client tcsh gnupg2 wget lftp autoconf automake gcc gfortran g++ unzip bzip2 tar make cmake && \
    rm -rf /var/lib/apt/lists/*
    
RUN wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB && \
    apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB && \
    rm GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB && \
    echo "deb https://apt.repos.intel.com/oneapi all main" > /etc/apt/sources.list.d/oneAPI.list && \
    echo "source /opt/intel/oneapi/setvars.sh -i_mpi_library_kind=release_mt" >> /etc/profile.d/intel.sh && \
    chmod a+x /etc/profile.d/intel.sh && \
    echo "source /etc/bash.bashrc >> ~/.bashrc" && \
    echo "source /etc/profile" >> ~/.bashrc

RUN apt-get update -y && \
    apt-get install -y intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic intel-oneapi-compiler-fortran intel-oneapi-mpi-devel && \
    cd /opt/intel/oneapi && rm -rf tbb conda_channel debugger dev-utilities && \
    rm -rf compiler/2021.3.0/linux/lib/oclfpga && \
    rm -f  compiler/2021.3.0/linux/compiler/lib/intel64_lin/*.a && \
    rm -f  compiler/2021.3.0/linux/lib/x64/libcommon_clang.so.2021.12.6.0 && \
    rm -rf compiler/2021.3.0/linux/lib/emu && \
    rm -f  compiler/2021.3.0/linux/bin/clang && \
    rm -f  compiler/2021.3.0/linux/bin/clang++ && \
    cd     compiler/2021.3.0/linux/bin && ls |grep -v intel64 |xargs rm -f && \
    rm -f /opt/intel/oneapi/mpi/2021.3.0/lib/release/*.a /opt/intel/oneapi/mpi/2021.3.0/lib/release_mt/*.a && \
    rm -rf /var/lib/apt/lists/*    
