from django.shortcuts import render
from budget.models import Compte, Ligne
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from requisitions.models import Requisition
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator

def getAllAccounts(id):
    comptes = Compte.objects.filter(module=id)
    total_open_credit = 0
    total_engagement = 0
    new_obj = []
    for cpte in comptes:
        total_open_credit += cpte.prevision
        total_engagement += cpte.executed
        new_obj.append({
            "account": cpte,
            "stats": round((cpte.executed / cpte.prevision) * 100, 2)
        })
    data = {
        'comptes': new_obj,
        'total_open_credit': total_open_credit,
        'total_engagement': total_engagement,
        "total_stats": round((total_engagement / total_open_credit) * 100, 2)
    }
    return data


@login_required(login_url='login')
def home(request, module=0):
    requisitions = Requisition.objects.filter(module=module).order_by('-created_at')
    compteInfo = getAllAccounts(module)
    paginator = Paginator(requisitions, 5)
    page = request.GET.get('page')
    paged_requisitions = paginator.get_page(page)
    requisitions_count = requisitions.count()
    context = {
        'comptes': compteInfo['comptes'],
        'total_open_credit': compteInfo['total_open_credit'],
        'total_engagement': compteInfo['total_engagement'],
        'total_stats': compteInfo['total_stats'],
        'requisitions': paged_requisitions,
        'requisitions_count': requisitions_count,
        'module': module,
    }
    return render(request, 'home.html', context)


@login_required(login_url='login')
def line(request, id):
    requisitions = Requisition.objects.order_by('-created_at')
    compte = Compte.objects.get(pk=id)
    lines = Ligne.objects.filter(compte=compte)
    sousCompte = []
    for line in lines:
        sousCompte.append({
            "code": line.code,
            "label": line.label,
            "executed":line.executed,
            "prevision": line.prevision,
            "stat": round((line.executed / line.prevision) * 100, 2)
        })
    total_engagement = 0
    compteInfo = getAllAccounts(compte.module)

    context = {
        'comptes': compteInfo['comptes'],
        'total_open_credit': compte.prevision,
        'total_engagement': compte.executed,
        "total_stats": round((compte.executed / compte.prevision) * 100, 2),
        'requisitions': requisitions,
        'compte': compte,
        'lines': sousCompte,
        'module': compte.module,
    }
    return render(request, 'home/line.html', context)


@login_required(login_url='login')
def search(request):
    requisitions = Requisition.objects.order_by('-created_at')
    compteInfo = getAllAccounts(1)
    if 'keyword' in request.GET and request.GET['keyword']:
        keyword = request.GET['keyword']
        if keyword.isdigit() and requisitions.filter(eng_number=keyword).exists():
            requisitions = requisitions.filter(eng_number=keyword)
            compteInfo = getAllAccounts(requisitions[0].module)
        elif keyword.lower().startswith("c"):
            if keyword[1:].isdigit() and Ligne.objects.filter(code=keyword[1:]).exists():
                keyword = keyword[1:]
                line = Ligne.objects.get(code=keyword)
                requisitions = Requisition.objects.filter(account=line).order_by('-created_at')
                compteInfo = getAllAccounts(requisitions[0].module)
            else:
                messages.warning(request, f"Aucune réquisition n'est trouvée avec le mot clé '{keyword}'!")
        else:
            messages.warning(request, f"Aucune réquisition n'est trouvée avec le mot clé '{keyword}'!")
    context = {
        'comptes': compteInfo['comptes'],
        'total_open_credit': compteInfo['total_open_credit'],
        'total_engagement': compteInfo['total_engagement'],
        'total_stats': compteInfo['total_stats'],
        'requisitions': requisitions,
        'module': requisitions[0].module,
    }
    print("in search ", requisitions[0].module)
    return render(request, 'home.html', context)