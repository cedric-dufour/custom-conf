## CUSTOM-CONF: File automatically created/updated [custom-conf-django]
# ex: set tabstop=2 filetype=python syntax=python :

## URLs mappings
from django.conf.urls.defaults import *

# Administration interface
# WARNING: Do NOT enable the administration interface unless required!
#from django.contrib import admin
#admin.autodiscover()

# Applications
import custom_conf_django
urlpatterns = patterns('',
	(r'', custom_conf_django.default),
)

