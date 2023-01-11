from django.http import HttpRequest
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from budgetapp.views import getAllAccounts
from budget.models import Ligne, Compte
from requisitions.models import Requisition
from django.contrib import messages
from decimal import Decimal


@login_required(login_url='login')
def create(request, module):
    if request.method == 'POST':
        account = request.POST['ligne']
        amount = Decimal(request.POST['amount'])
        label = request.POST['label']
        supplier_name = request.POST['supplier_name']
        purchase_order = request.POST['purchase_order']
        ligne = Ligne.objects.get(code=account)
        compte = Compte.objects.get(pk=ligne.compte.id)
        open_credit = ligne.prevision
        anterior_engagement = ligne.executed
        total_engagement = ligne.executed + amount
        if total_engagement > open_credit:
            messages.success(request, f"Le total des engagements ({total_engagement}) ne peut etre superieur au crédit ouvert ({open_credit})")
            lignes = Ligne.objects.all()
            compteInfo = getAllAccounts(module)
            context = {
                'comptes': compteInfo['comptes'],
                'total_open_credit': compteInfo['total_open_credit'],
                'total_engagement': compteInfo['total_engagement'],
                'total_stats': compteInfo['total_stats'],
                'lignes': lignes,
                'module': module
            }
            return render(request, 'requisition/create.html', context)
        total_expense = ligne.executed + amount
        available_amount = open_credit - total_expense
        eng_number = len(Requisition.objects.all()) + 1
        requisition = Requisition.objects.create(
            eng_number = eng_number,
            type=compte.label,
            purchase_order=purchase_order,
            label=label,
            supplier_name=supplier_name,
            account=ligne,
            amount=amount,
            anterior_engagement=anterior_engagement,
            open_credit=open_credit,
            total_engagement=total_engagement,
            total_expense=total_expense,
            available_amount=available_amount,
            status="open",
            module=compte.module
        )
        requisition.save()
        ligne.executed = total_engagement
        ligne.save()
        compte.executed += amount
        compte.save()
        messages.success(request, "La requisition est créée avec succés")
        return redirect('show_requisition', id=requisition.id)
    lignes = []
    compteInfo = getAllAccounts(module)
    cptes = Compte.objects.filter(module=module)
    for cpte in cptes:
        ligne = Ligne.objects.filter(compte=cpte)
        for lig in ligne:
            lignes.append(lig)
    context = {
        'comptes': compteInfo['comptes'],
        'total_open_credit': compteInfo['total_open_credit'],
        'total_engagement': compteInfo['total_engagement'],
        'total_stats': compteInfo['total_stats'],
        'lignes': lignes,
        'module': module,
    }
    return render(request, 'requisition/create.html', context)


@login_required(login_url='login')
def edit(request, id):
    requisition = Requisition.objects.get(pk=id)
    module = requisition.module
    if request.method == 'POST':
        account = request.POST['ligne']
        amount = Decimal(request.POST['amount'])
        label = request.POST['label']
        supplier_name = request.POST['supplier_name']
        purchase_order = request.POST['purchase_order']
        ligne = Ligne.objects.get(code=account)
        compte = Compte.objects.get(pk=ligne.compte.id)

        if ligne.id != requisition.account.id:
            print("*********code different************")
            old_ligne = Ligne.objects.get(pk=requisition.account.id)
            old_compte = Compte.objects.get(pk=old_ligne.compte.id)
            old_ligne.executed = old_ligne.executed - requisition.amount
            old_compte.executed = old_compte.executed - requisition.amount
            old_compte.save()
            old_ligne.save()
        else:
            #reset old amount on the current account
            print("********* meme compte ************")
            ligne.executed = ligne.executed - requisition.amount
            compte.executed = compte.executed - requisition.amount

        requisition.anterior_engagement = ligne.executed
        requisition.total_engagement = ligne.executed + amount
        requisition.total_expense = ligne.executed + amount
        requisition.available_amount = ligne.prevision - requisition.total_engagement

        ligne.executed = ligne.executed + amount
        compte.executed = compte.executed + amount

        requisition.label = label
        requisition.account = ligne
        requisition.supplier_name = supplier_name
        requisition.purchase_order = purchase_order
        requisition.amount = amount
        requisition.open_credit = ligne.prevision

        compte.save()
        ligne.save()
        requisition.status = "open"
        requisition.save()
        messages.success(request, "La requisition est modifié avec succés")
        return redirect('show_requisition', id=requisition.id)


    lignes = []
    compteInfo = getAllAccounts(module)
    cptes = Compte.objects.filter(module=module)
    for cpte in cptes:
        ligne = Ligne.objects.filter(compte=cpte)
        for lig in ligne:
            lignes.append(lig)
    compteInfo = getAllAccounts(requisition.module)
    context = {
        'comptes': compteInfo['comptes'],
        'total_open_credit': compteInfo['total_open_credit'],
        'total_engagement': compteInfo['total_engagement'],
        'total_stats': compteInfo['total_stats'],
        'lignes': lignes,
        'requisition': requisition,
        'module': module,
    }
    return render(request, 'requisition/edit.html', context)


@login_required(login_url='login')
def delete(request, id):
    requisition = get_object_or_404(Requisition, id=id)
    #old_ligne = Ligne.objects.get(pk=requisition.account.id)
    #old_compte = Compte.objects.get(pk=old_ligne.compte.id)
    #old_ligne.executed = old_ligne.executed - requisition.amount
    #old_compte.executed = old_compte.executed - requisition.amount
    #old_compte.save()
    #old_ligne.save()
    #requisition.delete()
    messages.warning(request, f"La requisition id={id} est supprimée definitivement")
    print(f"requisition {id} deleted")
    return redirect("home")


@login_required(login_url='login')
def show(request, id):
    requisition = get_object_or_404(Requisition, id=id)
    lignes = Ligne.objects.all()
    compteInfo = getAllAccounts(requisition.module)
    context = {
        'comptes': compteInfo['comptes'],
        'total_open_credit': compteInfo['total_open_credit'],
        'total_engagement': compteInfo['total_engagement'],
        'total_stats': compteInfo['total_stats'],
        'lignes': lignes,
        'requisition': requisition,
        'module': requisition.module,
    }
    return render(request, 'requisition/show.html', context)


@login_required(login_url='login')
def send(request, id):
    requisition = Requisition.objects.get(pk=id)
    requisition.status = "submitted"
    requisition.save()
    messages.success(request, "La requisition a été bien soumis pour la validation")
    return redirect('show_requisition', id=id)


@login_required(login_url='login')
def validate(request, id):
    requisition = Requisition.objects.get(pk=id)
    requisition.status = "validated"
    requisition.save()
    messages.success(request, "La requisition a été  validée avec succés")
    return redirect('show_requisition', id=id)


@login_required(login_url='login')
def return_cfo(request, id):
    requisition = Requisition.objects.get(pk=id)
    requisition.status = "returned"
    requisition.save()
    messages.success(request, "La requisition a été  retounée au gestionnaire")
    return redirect('show_requisition', id=id)


@login_required(login_url='login')
def return_gm(request, id):
    requisition = Requisition.objects.get(pk=id)
    requisition.status = "open"
    requisition.save()
    messages.success(request, "La requisition a été  retounée au DAR")
    return redirect('show_requisition', id=id)