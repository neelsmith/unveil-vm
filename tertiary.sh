
echo Installing ruby prerequisites for parsley...

rbenv install 2.2.3
rbenv global 2.2.3
ruby -v

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler

echo "Installing nokogiri"

gem install nokogiri


echo "Installing parsley"
cd /vagrant

/usr/bin/git clone https://github.com/goldibex/parsley-core.git

cd parsley-core/latin
rake
