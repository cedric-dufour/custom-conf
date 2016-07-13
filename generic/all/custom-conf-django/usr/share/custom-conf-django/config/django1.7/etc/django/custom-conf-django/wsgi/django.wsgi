## CUSTOM-CONF: File automatically created/updated [custom-conf-django]
# ex: set tabstop=2 filetype=python syntax=python :

# Dependencies
import os
import sys

# Application path
sys.path.append( '/etc/django/custom-conf-django/' )

# Settings module
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

# Application handler
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()

