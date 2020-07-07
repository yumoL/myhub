FROM jupyterhub/k8s-hub:0.9.0
USER root

#allowed uid and gid on openshift
ARG NB_UID=1017580000
ARG NB_GID=1017580000
ARG NB_USER=jovyan

# see https://github.com/jupyter/docker-stacks/issues/923
RUN userdel $NB_USER
RUN groupadd -g $NB_GID nbgroup
RUN useradd --home /home/$NB_USER -u $NB_UID -g $NB_GID -G 100 -l $NB_USER

USER $NB_USER