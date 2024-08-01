FROM ubuntu:20.04

WORKDIR /root

COPY ./1_install_dependencies.sh .
RUN ["./1_install_dependencies.sh"]
COPY ./2_download_openfoam.sh .
RUN ["./2_download_openfoam.sh"]
COPY ./3_openfoam_install.sh .
RUN ["./3_openfoam_install.sh"]
COPY ./4_hystrath_clone.sh .
RUN ["./4_hystrath_clone.sh"]
COPY ./6_module_installation.sh .
RUN ["./6_module_installation.sh"]