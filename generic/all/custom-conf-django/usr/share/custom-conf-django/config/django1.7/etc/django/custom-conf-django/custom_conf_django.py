## CUSTOM-CONF: File automatically created/updated [custom-conf-django]
# ex: set tabstop=2 filetype=python syntax=python :

# Dependencies
from django.template.loader import get_template
from django.template import Context
from django.http import HttpResponse

# Functions
def default( request ):
	t = get_template( 'custom-conf-django.default.html' )
	return HttpResponse( t.render( Context() ) )

def blank( request ):
	return HttpResponse( '' )

