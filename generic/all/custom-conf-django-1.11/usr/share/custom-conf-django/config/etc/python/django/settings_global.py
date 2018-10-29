## CUSTOM-CONF: File automatically created/updated [custom-conf-django]
#  ex: set tabstop=4 filetype=python syntax=python :
#  REF: https://docs.djangoproject.com/en/1.11/ref/settings/

## !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!!
#
#  Please import those global settings in your application's specific settings
#  > from settings_global import *
#
## !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!!


################################################################################
#
# CORE SETTINGS
#
################################################################################

# Secrets
from settings_secrets import *

# Timezone
TIME_ZONE = '%{CUSTOM_CONF_ETC_TIMEZONE}'
USE_TZ = True

# Locale
LANGUAGE_CODE = '%{CUSTOM_CONF_ETC_LOCALE}'
USE_I18N = True
USE_L10N = True

# E-mails
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = '%{CUSTOM_CONF_SMTP_SERVER}'

# Logging
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'null': {
            'class': 'logging.NullHandler',
        },
        'file': {
            'class': 'logging.FileHandler',
            'level': 'WARNING',
            'filename': '/var/log/python/django/global.log',
        },
        'email': {
            'class': 'django.utils.log.AdminEmailHandler',
            'level': 'ERROR',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'WARNING',
            'propagate': True,
        },
    },
}
# ... enable e-mail logging
#LOGGING['loggers']['django']['handlers'] = ['file', 'email'];

