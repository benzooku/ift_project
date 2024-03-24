gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash
source /etc/profile.d/rvm.sh
unset GEM_HOME
rvm install 3.3.0
rvm --default 3.3.0
