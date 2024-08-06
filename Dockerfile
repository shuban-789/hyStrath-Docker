FROM ubuntu:20.04

WORKDIR /root

COPY ./1_install_dependencies.sh .
RUN chmod +x /root/1_install_dependencies.sh
RUN ["./1_install_dependencies.sh"]
COPY ./2_download_openfoam.sh .
RUN chmod +x /root/2_download_openfoam.sh
RUN ["./2_download_openfoam.sh"]
COPY ./3_openfoam_install.sh .
RUN chmod +x /root/3_openfoam_install.sh
RUN ["./3_openfoam_install.sh"]
COPY ./4_hystrath_clone.sh .
RUN chmod +x /root/4_hystrath_clone.sh
RUN ["./4_hystrath_clone.sh"]
ENV USER=root
COPY ./5_module_installation.sh .
RUN chmod +x /root/5_module_installation.sh  
RUN ["./5_module_installation.sh"]
RUN ["bash", "-c", "echo 'source /root/OpenFOAM-v1706/etc/bashrc' >> ~/.bashrc"] 