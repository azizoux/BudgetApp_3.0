from django.http import HttpResponse
from requisitions.models import Requisition
from django.conf import settings

from budget.utils import render_to_pdf #created in step 4

def get(request, *args, **kwargs):
    id = request.POST['id']
    requisition = Requisition.objects.get(id=id)
    img = settings.STATIC_ROOT + "/images/logo.png"
    context = {
        'requisition': requisition,
        'img': img,
    }
    pdf = render_to_pdf('pdf/requisition.html', context)
    return HttpResponse(pdf, content_type='application/pdf')
