## CUSTOM-CONF: File automatically created/updated [custom-conf-django]
#  ex: set tabstop=4 filetype=python syntax=python :

# Dependencies
import os
import sys

# Django path
sys.path.insert(0, '/opt/django-1.11/lib/python%d.%d/site-packages' % tuple(sys.version_info)[0:2])

# Application path
sys.path.insert(0, '/usr/share/custom-conf-django/default/app')

# Configuration path
sys.path.insert(0, '/etc/python/django')

# Django settings
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

# Application handler
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()

