## CUSTOM-CONF: File automatically created/updated [custom-conf-django]
#  ex: set tabstop=4 filetype=python syntax=python :

# Dependencies
from django.template.loader import get_template
from django.http import HttpResponse

# Functions
def default(request):
    template = get_template('default.html')
    return HttpResponse(template.render())

def blank(request):
    return HttpResponse('')

