from django.http import HttpResponse
from requisitions.models import Requisition

from budget.utils import render_to_pdf #created in step 4

def get(request, *args, **kwargs):
    id = request.POST['id']
    requisition = Requisition.objects.get(id=id)
    print(requisition)
    context = {
            'today': "12/12/2022", 
            'amount': 39.99,
        'customer_name': 'Cooper Mann',
        'order_id': 1233434,
        'requisition': requisition
    }
    pdf = render_to_pdf('pdf/requisition.html', context)
    return HttpResponse(pdf, content_type='application/pdf')
