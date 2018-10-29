## Sample Django <-> WSGI configuration

# Dependencies
import os
import sys

# Django path
sys.path.insert(0, '/opt/django/lib/python%d.%d/site-packages' % tuple(sys.version_info)[0:2])

# Application path
sys.path.insert(0, '/opt/myApp')

# Configuration path
# ... application-specific
sys.path.insert(0, '/etc/python/django/myApp')
# ... global
sys.path.insert(0, '/etc/python/django')

# Django settings
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

# Application handler
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()

