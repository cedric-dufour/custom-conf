## CUSTOM-CONF: File automatically created/updated [custom-conf-django]
#  ex: set tabstop=4 filetype=python syntax=python :
#  REF: https://docs.djangoproject.com/en/1.11/ref/settings/

# Global settings
from settings_global import *


################################################################################
#
# CORE SETTINGS
#
################################################################################

# Templates resources
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['/usr/share/custom-conf-django/default/templates']
    },
]

# URLs mapper
ALLOWED_HOSTS = ['*']
ROOT_URLCONF = 'urls'

