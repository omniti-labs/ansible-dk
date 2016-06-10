################################################
#
#  Use this dockerfile to build for ubuntu without test-kitchen
#  To build the image: `docker build -t omnibus-ansible-dk .`
#  To run the omnibus build: `docker run -v /Users/USER/ansible-dk:/ansible-dk -it --rm omnibus-ansible-dk`
#
################################################
FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get install -y wget git build-essential && \
  rm -rf /var/lib/apt/lists/* && \
  wget -q https://packages.chef.io/stable/debian/8/chefdk_0.11.2-1_amd64.deb && \
  dpkg -i chefdk_*.deb

RUN \
  git config --global user.name "Omnibus" && \
  git config --global user.email "omnibus@chef.io" && \
  git config --global core.ignorecase true

RUN \
  wget -q https://raw.githubusercontent.com/omniti-labs/ansible-dk/master/Gemfile && \
  bash -c 'eval "$(chef shell-init bash)"; bundle install'

WORKDIR /ansible-dk

CMD /bin/bash -c 'eval "$(chef shell-init bash)"; bundle install; bundle exec omnibus build ansible-dk'
