## CUSTOM-CONF: File automatically created/updated [custom-conf-django]
# ex: set tabstop=2 filetype=python syntax=python :

## URLs mappings
from django.conf.urls import patterns, include, url

# Administration interface
# WARNING: Do NOT enable the administration interface unless required!
#from django.contrib import admin

# Applications
import custom_conf_django
urlpatterns = patterns('',
	(r'', custom_conf_django.default),
  #url(r'^admin/', include(admin.site.urls)),
)

