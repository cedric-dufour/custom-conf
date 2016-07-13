## CUSTOM-CONF: File automatically created/updated [custom-conf-django]
# ex: set tabstop=2 filetype=python syntax=python :

## Sample settings for Django applications

# Global settings
ALLOWED_HOSTS = ['*']
SITE_ID = 1
DEBUG = False  # WARNING: Do NOT enable debugging on production sites!
TEMPLATE_DEBUG = DEBUG
ADMINS = ( ( 'Webmaster', 'webmaster@%{CUSTOM_CONF_DJANGO_DOMAIN}' ) )
MANAGERS = ADMINS
SECRET_KEY = '%{CUSTOM_CONF_DJANGO_SECRET}'

# Database parameters
# WARNING: Make sure to enforce the proper permissions on this file!
DATABASES = {
	'default': {
		'ENGINE': 'django.db.backends.', # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'
		'NAME': '',
		'USER': '',
		'PASSWORD': '',
		'HOST': '',
		'PORT': '',
  }
}

# Regional settings
TIME_ZONE = 'Europe/Zurich'
LANGUAGE_CODE = 'en-gb'
USE_I18N = True
USE_L10N = True

# Media resources
MEDIA_ROOT = '/usr/share/custom-conf-django/htdocs/media/'
MEDIA_URL = '/media/'
ADMIN_MEDIA_PREFIX = '/media/'

# Other resources
ROOT_URLCONF = 'urls'
INSTALLED_APPS = (
	'django.contrib.auth',
	'django.contrib.contenttypes',
	'django.contrib.sessions',
	'django.contrib.sites',
	'django.contrib.messages',
	# Administration interface
	# WARNING: Do NOT enable the administration interface unless required!
	#'django.contrib.admin',
	#'django.contrib.admindocs',
)
MIDDLEWARE_CLASSES = (
	'django.middleware.common.CommonMiddleware',
	'django.contrib.sessions.middleware.SessionMiddleware',
	'django.middleware.csrf.CsrfViewMiddleware',
	'django.contrib.auth.middleware.AuthenticationMiddleware',
	'django.contrib.messages.middleware.MessageMiddleware',
  #'django.middleware.clickjacking.XFrameOptionsMiddleware',
)
TEMPLATE_DIRS = (
	'/usr/share/custom-conf-django/templates',
)
TEMPLATE_LOADERS = (
	'django.template.loaders.filesystem.Loader',
	'django.template.loaders.app_directories.Loader',
	#'django.template.loaders.eggs.Loader',
)

# Logging
LOGGING = {
  'version': 1,
  'disable_existing_loggers': False,
  'handlers': {
    'file': {
      'level': 'WARNING',
      'class': 'logging.FileHandler',
      'filename': '/var/log/django/custom-conf-django.log',
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

