#!/usr/bin/env bash

cd /usr/src/geoq
sudo /var/lib/geoq/bin/python manage.py collectstatic --noinput
sudo cp -r /vagrant/geoq-repo/geoq/core/static/core/js/* /usr/src/static/core/js/
echo -e "Javascript and css were moved to static\n"


sudo service nginx restart
sudo killall -9 uwsgi
sudo /var/lib/geoq/bin/uwsgi --ini /var/lib/geoq/geoq.ini --py-auto-reload=3 &
echo -e "Nginx and uWSGI should have restarted\n"
echo -e "\n"