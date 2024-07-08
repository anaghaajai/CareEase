import base64
import random

import datetime

from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from .models import *
import random
import cryptocode

import nltk
# nltk.download('stopwords')

# Create your views here.
def logg(request):
    return render(request, "login.html")
def logg_post(request):
    uname=request.POST['textfield']
    psw=request.POST['textfield2']
    lg=login.objects.filter(username=uname)
    if lg.exists():
        lg=lg[0]
        enc_psw=lg.password
        if lg.usertype!="admin":
            dec_psw=cryptocode.decrypt(enc_psw, "1234")
        else:
            dec_psw=enc_psw
        if psw ==dec_psw:
            request.session['lid']=lg.id
            if lg.usertype == "admin":
                return redirect("/admin_home")
            elif lg.usertype == "volunteer":
                res=volunteer.objects.get(LOGIN_id=lg.id)
                request.session['uname']=res.name
                return redirect("/vol_home")
            elif lg.usertype == "doctor":
                res=doctor.objects.get(LOGIN_id=lg.id)
                request.session['uname']=res.name
                return redirect("/doc_home")
            elif lg.usertype == "user":
                res=user.objects.get(LOGIN_id=lg.id)
                request.session['uname']=res.user_name
                return redirect("/user_home")
        else:
            return HttpResponse("<script>alert('Invalid password');window.location='/';</script>")

    else:
        return HttpResponse("<script>alert('Invalid username');window.location='/';</script>")


def admin_home(request):
    return render(request, "admin/admin_home.html")

def admin_add_med(request):
    return render(request, "admin/add_medicine.html")

def admin_add_med_post(request):
    name=request.POST['t1']
    descr=request.POST['t2']
    obj=medicine()
    obj.med_name=name
    obj.description=descr
    obj.save()
    return HttpResponse("<script>alert('Medicine added');window.location='/admin_view_med';</script>")

def admin_view_med(request):
    res=medicine.objects.all()
    return render(request, "admin/view_medicine.html", {'data':res})

def admin_delete_med(request, id):
    medicine.objects.get(id=id).delete()
    return redirect("/admin_view_med")

def admin_add_symp(request):
    return render(request, "admin/add_symptoms.html")


def admin_add_symp_post(request):
    name=request.POST['t1']
    descr=request.POST['t2']
    obj=symptoms()
    obj.symptom_name=name
    obj.details=descr
    obj.save()
    return HttpResponse("<script>alert('Symptom added');window.location='/admin_view_symp';</script>")

def admin_view_symp(request):
    res=symptoms.objects.all()
    return render(request, "admin/view_symptoms.html", {'data':res})

def admin_delete_symp(request, id):
    symptoms.objects.get(id=id).delete()
    return redirect("/admin_view_symp")

def admin_view_symptom_options(request, id):
    res=symptom_option.objects.filter(SYMPTOMS_id=id)
    return render(request, "admin/view_symptom_options.html", {'data':res, 'id':id})
def admin_delete_symptom_options(request, sid, id):
    symptom_option.objects.get(id=sid).delete()
    return redirect("/admin_view_symptom_options/"+id)

def admin_add_options(request, id):
    opt=request.POST['t1']
    obj=symptom_option()
    obj.option_name=opt
    obj.SYMPTOMS_id=id
    obj.save()
    return redirect("/admin_view_symptom_options/"+id)

def admin_view_users(request):
    res=user.objects.all()
    return render(request, "admin/view_users.html", {'data':res})

def admin_view_volunteers(request):
    res=volunteer.objects.all()
    return render(request, "admin/view_volunteers.html", {'data':res})
def admin_delete_volunteers(request, id):
    volunteer.objects.get(id=id).delete()
    return redirect("/admin_view_volunteers")

def admin_add_volunteer(request):
    return render(request, "admin/add_volunteer.html")

def admin_add_volunteer_post(request):
    name=request.POST['t1']
    email=request.POST['t2']
    phone=request.POST['t3']
    exp=request.POST['t4']
    psw=random.randint(1000, 9999)
    enc_pswd=cryptocode.encrypt(str(psw), "1234")
    lg=login()
    lg.username=email
    lg.password=enc_pswd
    lg.usertype="volunteer"
    lg.save()
    obj=volunteer()
    obj.name=name
    obj.email=email
    obj.phone=phone
    obj.experience=exp
    obj.LOGIN=lg
    obj.save()
    return redirect("/admin_view_volunteers")

def admin_view_vol_req(request):
    res=volunteer_request.objects.filter(status="pending")
    return render(request, "admin/view_volunteer_request.html", {'data':res})

def admin_allocate_vol(request, id):
    res=volunteer.objects.all()
    return render(request, "admin/allocate_volunteer.html", {'data':res, "id":id})
def admin_allocate_vol_post(request, id):
    vid=request.POST['select']
    obj=request_alloc()
    obj.VOLUNTEER_id=vid
    obj.REQUEST_id=id
    obj.status="pending"
    obj.save()
    volunteer_request.objects.filter(id=id).update(status="allocated")
    return redirect("/admin_view_vol_req")

def admin_view_request_status(request):
    res=request_alloc.objects.all()
    return render(request, "admin/view_request_status.html", {'data':res})

def adm_view_doc_suggestions(request):
    res=suggestions.objects.filter(type="doctor")
    data=[]
    for i in res:
        doc=doctor.objects.get(LOGIN=i.LOGIN)
        data.append({
            'id':i.id, "date":i.date, "suggestion":i.suggestion, "type":i.type, "name":doc.name
        })
    return render(request, "admin/view_doc_suggestions.html", {'data':data})


def adm_view_user_suggestions(request):
    res=suggestions.objects.filter(type="user")
    data=[]
    for i in res:
        usr=user.objects.get(LOGIN=i.LOGIN)
        data.append({
            'id':i.id, "date":i.date, "suggestion":i.suggestion, "type":i.type, "name":usr.user_name
        })
    return render(request, "admin/view_user_suggestions.html", {'data':data})

def adm_del_suggestions(request, id):
    suggestions.objects.filter(id=id).delete()
    return redirect("/admin_home")




#########################           VOLUNTEER
def vol_home(request):
    return render(request, "volunteer/vol_home.html")

def vol_profile(request):
    res=volunteer.objects.get(LOGIN_id=request.session['lid'])
    return render(request, "volunteer/view_profile.html", {'data':res})

def vol_profile_post(request):
    name=request.POST['t1']
    email=request.POST['t2']
    phone=request.POST['t3']
    exp=request.POST['t4']
    res=volunteer.objects.get(LOGIN_id=request.session['lid'])
    res.name=name
    res.email=email
    res.phone=phone
    res.exp=exp
    res.save()
    return HttpResponse("<script>alert('Profile updated');window.location='/vol_profile';</script>")


def vol_allocated_request(request):
    res=request_alloc.objects.filter(VOLUNTEER__LOGIN_id=request.session['lid'])
    return render(request, "volunteer/view_allocated_request.html", {'data':res})

def vol_update_status(request, id):
    res=request_alloc.objects.get(id=id)
    if res.status == "pending":
        stat=""
    else:
        stat=res.status
    return render(request, "volunteer/update_status.html", {'stat':stat, "id":id})

def vol_update_status_post(request, id):
    stat=request.POST['t1']
    request_alloc.objects.filter(id=id).update(status=stat)
    return HttpResponse("<script>alert('Status updated');window.location='/vol_allocated_request';</script>")






######################          DOCTOR
def register(request):
    return render(request, "doctor/rrgister.html")
def reg_post(request):
    name = request.POST['t1']
    email = request.POST['t2']
    phone = request.POST['t3']
    exp = request.POST['t4']
    spec = request.POST['t5']
    psw = request.POST['t6']

    enc_pswd=cryptocode.encrypt(str(psw), "1234")
    lg = login()
    lg.username = email
    lg.password = enc_pswd
    lg.usertype = "doctor"
    lg.save()
    obj = doctor()
    obj.name = name
    obj.email = email
    obj.phone = phone
    obj.experience = exp
    obj.specialization = spec
    obj.LOGIN = lg
    obj.save()
    return HttpResponse("<script>alert('Registered');window.location='/';</script>")

def doc_home(request):
    return render(request, "doctor/doc_home.html")

def doc_profile(request):
    res=doctor.objects.get(LOGIN_id=request.session['lid'])
    return render(request, "doctor/view_profile.html", {'data':res})
def doc_profile_post(request):
    name=request.POST['t1']
    email=request.POST['t2']
    phone=request.POST['t3']
    exp=request.POST['t4']
    spec=request.POST['t5']
    res = doctor.objects.get(LOGIN_id=request.session['lid'])
    res.name=name
    res.email=email
    res.phone=phone
    res.specialization=spec
    res.experience=exp
    res.save()
    return HttpResponse("<script>alert('Profile updated');window.location='/doc_profile';</script>")

def doc_view_sched(request):
    res=schedule.objects.filter(DOCTOR__LOGIN_id=request.session['lid'])
    return render(request, "doctor/view_schedules.html", {'data':res})

def doc_delete_sched(request, id):
    schedule.objects.get(id=id).delete()
    return redirect("/doc_view_sched")

def doc_add_schedule(request):
    return render(request, "doctor/add_schedule.html")
def doc_add_schedule_post(request):
    date=request.POST['t1']
    from_time=request.POST['t2']
    to_time=request.POST['t3']
    obj=schedule()
    obj.date=date
    obj.from_time=from_time
    obj.to_time=to_time
    obj.DOCTOR=doctor.objects.get(LOGIN_id=request.session['lid'])
    obj.save()
    return HttpResponse("<script>alert('Schedule added');window.location='/doc_view_sched';</script>")

def doc_view_bookings(request, id):
    res=booking.objects.filter(SCHEDULE_id=id).order_by("id")
    return render(request, "doctor/view_bookings.html", {'data':res})

def doc_view_nutrient_list(request, id):
    res=nutrients_list.objects.filter(USER_id=id)
    return render(request, "doctor/view_nutrients.html", {'data':res, 'id':id})

def doc_delete_nutrients(request, id, uid):
    nutrients_list.objects.filter(id=id).delete()
    return redirect("/doc_view_nutrient_list/" + uid)

def doc_add_nutrient(request, id):
    return render(request, "doctor/add_nutrient.html", {'id':id})
def doc_add_nutrient_post(request, id):
    nutri=request.POST.getlist('check')
    print(nutri)
    for i in nutri:
        res=nutrients_list.objects.filter(USER_id=id, nutrient=i)
        if not res.exists():
            obj=nutrients_list()
            obj.USER_id=id
            obj.nutrient=i
            obj.save()
    return HttpResponse("<script>alert('Nutrient list added');window.location='/doc_view_nutrient_list/"+id+"';</script>")

import matplotlib.pyplot as plt
def doc_view_symptom_logs(request, id):
    res=symptom_logs.objects.filter(USER_id=id).order_by("-id")
    symps=[]
    for i in res:
        if i.SYMPTOM_OPTION.SYMPTOMS.symptom_name not in symps:
            symps.append(i.SYMPTOM_OPTION.SYMPTOMS.symptom_name)
    graph_data=[]
    main_scores=[]
    dates = []
    for j in symps:
        scores=[]
        res2=symptom_logs.objects.filter(USER_id=id, SYMPTOM_OPTION__SYMPTOMS__symptom_name=j)
        for k in res2:
            if k.date not in dates:
                dates.append(k.date)
            scr=0
            if k.SYMPTOM_OPTION.option_name == "low":
                scr=0
            elif k.SYMPTOM_OPTION.option_name == "mild":
                scr=1
            if k.SYMPTOM_OPTION.option_name == "high":
                scr=2
            scores.append(scr)
        main_scores.append(scores)
    print(dates)
    print(symps)
    print(main_scores)
    for i in range(len(symps)):
        plt.plot(dates, main_scores[i], label=symps[i])
    plt.legend()
    d=datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    plt.savefig(r"C:\Users\sonas\PycharmProjects\palliative_care\myapp\static\graphs\\" + d + ".png")
    plt.close()
    path="/static/graphs/" + d + ".png"
    return render(request, "doctor/view_symptom_logs.html", {'data':res, 'path':path})

def doc_add_prescriptions(request, id):
    request.session['bookid']=id
    res=medicine.objects.all()
    res2=prescription.objects.filter(BOOKING_id=id)
    return render(request, "doctor/add_prescriptions.html", {'data':res, "data2":res2, "id":id})

def doc_add_prescription_post(request, id):
    mid=request.POST['select']
    dose=request.POST['t1']
    obj=prescription()
    obj.BOOKING_id=id
    obj.MEDICINE_id=mid
    obj.dosage=dose
    obj.save()
    bid=request.session['bookid']
    return HttpResponse("<script>alert('Added');window.location='/doc_add_prescriptions/" + bid + "';</script>")


def doc_delete_prescription(request, id):
    prescription.objects.filter(id=id).delete()
    bid=request.session['bookid']
    return HttpResponse("<script>alert('Deleted');window.location='/doc_add_prescriptions/"+bid+"';</script>")


def doc_send_suggestion(request):
    return render(request, "doctor/add_suggestion.html")

def doc_send_suggestion_post(request):
    sugg=request.POST['t1']
    obj=suggestions()
    obj.date=datetime.datetime.now().date()
    obj.type="doctor"
    obj.suggestion=sugg
    obj.LOGIN=login.objects.get(id=request.session['lid'])
    obj.save()
    return HttpResponse(
        "<script>alert('Suggestion sent');window.location='/doc_send_suggestion';</script>")

def logout(req):
    return  redirect("/")


######              USER
def user_reg(request):
    return render(request, "user/register.html")
def user_reg_post(request):
    name=request.POST['name']
    post=request.POST['post']
    place=request.POST['place']
    pin=request.POST['pin']
    password=request.POST['password']
    phone=request.POST['phone']
    email=request.POST['email']
    image=request.FILES['image']
    timestr = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    fs=FileSystemStorage()
    fs.save(r"C:\Users\sonas\PycharmProjects\palliative_care\media\\"+timestr + ".png", image)
    path = "/media/" + timestr + ".png"

    enc_pswd=cryptocode.encrypt(str(password), "1234")
    obj=login()
    obj.username=email
    obj.password=enc_pswd
    obj.usertype="user"
    obj.save()

    obj1=user()
    obj1.user_name=name
    obj1.email=email
    obj1.phone=phone
    obj1.place=place
    obj1.post=post
    obj1.pin=pin
    obj1.certificate=path
    obj1.LOGIN=obj
    obj1.save()
    return HttpResponse("<script>alert('Registered');window.location='/user_reg';</script>")

def user_home(request):
    return render(request, "user/user_home.html")

def user_profile(request):
    res=user.objects.get(LOGIN_id=request.session['lid'])
    return render(request, "user/view_profile.html", {'data':res})

def user_profile_post(request):
    name=request.POST['name']
    email=request.POST['email']
    phone=request.POST['phone']
    place=request.POST['place']
    post=request.POST['post']
    pin=request.POST['pin']
    res=user.objects.get(LOGIN_id=request.session['lid'])
    res.user_name=name
    res.email=email
    res.phone=phone
    res.place=place
    res.pin=pin
    res.post=post
    if 'file' in request.FILES:
        file=request.FILES['file']
        d=datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        fs = FileSystemStorage()
        fs.save(r"C:\Users\sonas\PycharmProjects\palliative_care\media\\" + d + ".png", file)
        path = "/media/" + d + ".png"
        res.certificate=path
    res.save()
    return HttpResponse("<script>alert('Profile updated');window.location='/user_profile';</script>")

def user_view_symptom_logs(request):
    lid = request.session['lid']
    res = symptom_logs.objects.filter(USER__LOGIN_id=lid).order_by("-id")
    return render(request, "user/view_symptom_logs.html", {'data':res})

def user_graph(request):
    lid = request.session['lid']
    res = symptom_logs.objects.filter(USER__LOGIN_id=lid).order_by("-id")
    symps = []
    for i in res:
        if i.SYMPTOM_OPTION.SYMPTOMS.symptom_name not in symps:
            symps.append(i.SYMPTOM_OPTION.SYMPTOMS.symptom_name)
    graph_data = []
    main_scores = []
    dates = []
    try:
        for j in symps:
            scores = []
            res2 = symptom_logs.objects.filter(USER__LOGIN_id=lid, SYMPTOM_OPTION__SYMPTOMS__symptom_name=j)
            for k in res2:
                if k.date not in dates:
                    dates.append(k.date)
                scr = 0
                if k.SYMPTOM_OPTION.option_name == "low":
                    scr = 0
                elif k.SYMPTOM_OPTION.option_name == "mild":
                    scr = 1
                if k.SYMPTOM_OPTION.option_name == "high":
                    scr = 2
                scores.append(scr)
            main_scores.append(scores)
        print(dates)
        print(symps)
        print(main_scores)
        for i in range(len(symps)):
            plt.plot(dates, main_scores[i], label=symps[i])
        plt.legend()
        d = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        plt.savefig(r"C:\Users\sonas\PycharmProjects\palliative_care\myapp\static\graphs\\" + d + ".png")
        plt.close()
        path = "/static/graphs/" + d + ".png"
        return render(request, "user/view_symptom_logs2.html", {'path':path})
    except Exception as e:
        return HttpResponse("<script>alert('Symptom logs not complete');window.location='/user_view_symptom_logs';</script>")


def user_delete_logs(request, id):
    symptom_logs.objects.filter(id=id).delete()
    return redirect("/user_view_symptom_logs")

def user_view_symptoms(request):
    res=symptoms.objects.all()
    return render(request, "user/view_symptoms.html", {'data':res})

def user_view_symptom_level(request, sid):
    res=symptom_option.objects.filter(SYMPTOMS_id=sid)
    return render(request, "user/view_symptom_options.html", {'data':res})

def user_add_level(request, oid):
    lid=request.session['lid']
    opt=symptom_option.objects.get(id=oid)
    symp_id=opt.SYMPTOMS_id
    obj=symptom_logs.objects.filter(USER__LOGIN_id=lid, SYMPTOM_OPTION__SYMPTOMS_id=symp_id, date=datetime.datetime.now().date())
    if obj.exists():
        obj=obj[0]
        obj.SYMPTOM_OPTION_id=oid
        obj.save()
    else:
        obj=symptom_logs()
        obj.USER=user.objects.get(LOGIN_id=lid)
        obj.SYMPTOM_OPTION_id=oid
        obj.date=datetime.datetime.now().date()
        obj.save()
    return HttpResponse("<script>alert('Symptom logs added');window.location='/user_view_symptom_logs';</script>")


def user_view_my_items(request):
    lid=request.session['lid']
    res=items.objects.filter(USER__LOGIN_id=lid).order_by("id")
    return render(request, "user/view_my_items.html", {'data':res})


def user_delete_items(request, id):
    items.objects.filter(id=id).delete()
    return redirect("/user_view_my_items#content")

def user_add_items(request):
    return render(request, "user/add_items.html")

def user_add_items_post(request):
    title=request.POST['t1']
    descr=request.POST['t2']
    lid=request.session['lid']
    image=request.FILES['f1']
    timestr = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    fs=FileSystemStorage()
    fs.save(r"C:\Users\sonas\PycharmProjects\palliative_care\media\\"+timestr + ".png", image)
    path = "/media/" + timestr + ".png"

    obj1=items()
    obj1.title=title
    obj1.description=descr
    obj1.image=path
    obj1.status="Available"
    obj1.USER=user.objects.get(LOGIN_id=lid)
    obj1.save()
    return HttpResponse("<script>alert('Item added');window.location='/user_view_my_items';</script>")


def user_view_request(request, id):
    res = item_request.objects.filter(ITEM_id=id, status="pending")
    request.session['rid']=id
    data = []
    for i in res:
        data.append({
            'id': i.id, "name": i.USER.user_name, "phone": i.USER.phone, "cert": str(i.USER.certificate)
        })
    return render(request, "user/view_item_requests.html", {'data':data})



def user_approve_request(request, id):
    res=item_request.objects.get(id=id)
    res.status="Approved"
    res.save()
    items.objects.filter(id=res.ITEM_id).update(status="Donated")
    res2=item_request.objects.filter(~Q(id=id),ITEM_id=res.ITEM_id)
    for i in res2:
        # if i.id!=res.id:
            i.status="Rejected"
            i.save()
    rid=request.session['rid']
    return HttpResponse("<script>alert('Accepted');window.location='/user_view_request/"+rid+"';</script>")


def user_reject_request(request, id):
    item_request.objects.filter(id=id).update(status="Rejected")
    rid=request.session['rid']
    return HttpResponse("<script>alert('Rejected');window.location='/user_view_request/"+rid+"';</script>")


def user_view_others_items(request):
    lid=request.session['lid']
    res=items.objects.filter(~Q(USER__LOGIN_id=lid), status="Available").order_by("-id")
    return render(request, "user/view_others_items.html", {"data":res})

def user_send_request(request, id):
    lid=request.session['lid']
    res=item_request.objects.filter(ITEM_id=id, USER__LOGIN_id=lid)
    if res.exists():
        return HttpResponse("<script>alert('Already requested');window.location='/user_view_others_items';</script>")
    else:
        obj=item_request()
        obj.ITEM_id=id
        obj.USER=user.objects.get(LOGIN_id=lid)
        obj.status="pending"
        obj.save()
        return HttpResponse("<script>alert('Successfully requested');window.location='/user_view_others_items';</script>")

def user_view_request_status(request):
    lid = request.session['lid']
    res = item_request.objects.filter(USER__LOGIN_id=lid).order_by("-id")
    return render(request, "user/view_request_status.html", {'data':res})

def user_view_doctors(request):
    res=doctor.objects.all()
    return render(request, "user/view_doctors.html", {'data':res})

def user_view_schedules(request, id):
    res=schedule.objects.filter(DOCTOR_id=id)
    request.session['docid']=id
    return render(request, "user/view_schedules.html", {'data':res})

def user_book_appointment(request, id):
    docid=request.session['docid']
    res=booking.objects.filter(SCHEDULE_id=id, USER__LOGIN_id=request.session['lid'])
    if res.exists():
        return HttpResponse(
            "<script>alert('Already booked');window.location='/user_view_schedules/"+docid+"';</script>")
    else:
        res2 = booking.objects.filter(SCHEDULE_id=id)
        if res2.exists():
            if len(res2) >=2:
                return HttpResponse(
                    "<script>alert('Slot unavailable. No more booking allowed!');window.location='/user_view_schedules/" + docid + "';</script>")
            else:
                res2=res2.order_by("-id")[0]
                tkn=res2.token
                token=int(tkn) + 1
        else:
            token=1
        obj=booking()
        obj.date=datetime.datetime.now().date()
        obj.SCHEDULE_id=id
        obj.USER= user.objects.get(LOGIN_id=request.session['lid'])
        obj.token=token
        obj.save()
    return HttpResponse(
        "<script>alert('Booked successfully');window.location='/user_view_schedules/" + docid + "';</script>")

def user_view_bookings(request):
    res=booking.objects.filter(USER__LOGIN_id=request.session['lid'])
    return render(request, "user/view_bookings.html", {'data':res})

def user_view_prescriptions(request, id):
    res=prescription.objects.filter(BOOKING_id=id)
    return render(request, "user/view_prescriptions.html", {'data':res})

def chatbot(request):
    return render(request,"user/chatbot.html")


def chatbot_add_chat(request):
    # toid = request.form['toid']
    message = request.POST['m']

    q3=question_table.objects.all()
    score=[]
    ans=[]
    for i in q3:
        qtns=i.question
        answer=i.answer
        # import spacy
        # nlp = spacy.load("en_core_web_lg")

        sim=cht(message, qtns)
        print("LL ", sim, qtns)
        score.append(sim)
        ans.append(answer)
    temp=round(score[0],2)
    score[0]=round(score[0],2)
    for j in range(1, len(score)):
        if round(score[j], 2) > temp:
            temp=round(score[j], 2)
            score[j]=round(score[j], 2)
    print("Scr ", score)
    print("High   ",temp)
    obj = chat()
    obj.LOGIN_id = request.session['lid']
    obj.message = message
    obj.type = 'user'
    obj.save()
    if temp<0.55:
        answ="Sorry.. i didnt get you"
        obj = chat()
        obj.LOGIN_id = request.session['lid']
        obj.message = answ
        obj.type = 'chatbot'
        obj.save()
    else:
        idx=score.index(temp)
        answ=str(ans[idx])
        obj = chat()
        obj.LOGIN_id = request.session['lid']
        obj.message = answ
        obj.type = 'chatbot'
        obj.save()
    return JsonResponse({"status":"ok"})

import spacy
def cht(a,b):

    nlp = spacy.load("en_core_web_lg")
    doc1 = nlp(a)
    doc2 = nlp(b)
    # print(doc1,doc2)
    ans=(doc1.similarity(doc2))
    # print("aaaaaaaaa",ans)
    return ans


def chatbot_view_chat(request):
    # lastid = request.POST['lastid']
    # print(lastid)
    q3=chat.objects.filter(LOGIN_id=request.session['lid'])
    print(q3,"jiiiiiiiiiiiiii")
    ar=[]
    for i in q3:
        ar.append({
            'message':i.message,
            'type':i.type,
            'id':i.id
        })
    return JsonResponse({"status":"ok","data":ar})




def chatbot_delete_chat(request):
    chat.objects.filter(LOGIN_id=request.session['lid']).delete()
    return JsonResponse({"status":"ok"})

def user_view_pat_comm(request):
    res=posts.objects.filter(date__lte=datetime.datetime.now().date()).order_by("-id")
    data=[]
    for i in res:
        res2=comments.objects.filter(POSTS=i)
        if res2.exists():
            comms=len(res2)
        else:
            comms=0
        data.append({
            'user_name' : i.USER.user_name, 'date':i.date, 'title':i.title, 'image':i.image, 'comms':comms, 'id':i.id
        })
    return render(request, "user/patient_community.html", {'data':data})

def user_add_comment(request, id):
    res=comments.objects.filter(POSTS_id=id)
    return render(request, "user/add_comment.html", {'data':res, 'id':id})

def user_add_comment_post(request, id):
    comm=request.POST['t1']
    obj=comments()
    obj.date=datetime.datetime.now().date()
    obj.comment=comm
    obj.POSTS_id=id
    obj.USER=user.objects.get(LOGIN_id=request.session['lid'])
    obj.save()
    return redirect("/user_add_comment/"+id)

def add_post(request):
    return render(request, "user/add_post.html")

def add_post_pst(request):
    title=request.POST['t1']
    if 'f1' in request.FILES:
        img=request.FILES['f1']
        d=datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        fs=FileSystemStorage()
        fs.save(r"C:\Users\sonas\PycharmProjects\palliative_care\media\\" + d + ".jpg", img)
        path="/media/" + d + ".jpg"
    else:
        path="pending"
    obj=posts()
    obj.date=datetime.datetime.now().date()
    obj.title=title
    obj.image=path
    obj.USER=user.objects.get(LOGIN_id=request.session['lid'])
    obj.save()
    return HttpResponse(
        "<script>alert('Post added');window.location='/user_view_pat_comm';</script>")


# Define food options
protein_options = {
    "general": ["Grilled Chicken", "Turkey", "Salmon", "Trout", "Lentils", "Beans", "Tofu"],
    "diabetes": ["Split Peas", "Edamame", "Soy Nuts", "Tuna", "Tilapia"],
    "hypertension": ["Salmon", "Halibut", "Whole Eggs", "Walnuts", "Cashews", "Almonds"]
}

fat_options = {
    "general": ["Avocado", "Nuts", "Seeds", "Olive Oil", "Avocado Oil"],
    "diabetes": ["Skinless Poultry", "Salmon", "Tahini", "Mackarel"],
    "hypertension": ["Almonds", "Peanuts", "Sardines", "Salmon", "Flaxseeds", "Walnuts"]
}

grain_options = {
    "general": ["Quinoa", "Whole Wheat Pasta", "Whole Grain Bread"],
    "diabetes": ["Barley", "Bulgur", "Beans"],
    "hypertension": ["Whole Grain Foods", "Brown rice", "Oats"]
}

vegetable_options = {
    "general": ["Mushrooms", "Carrots", "Swiss Chard", "Carrots", "Beets", "Sweet Potatoes"],
    "diabetes": ["Spinach", "Kale", "Lettuce", "Broccoli", "Cauliflower", "Cucumbers", "Tomatoes"],
    "hypertension": ["Collard Greens", "Arugula", "Bok Choy", "Onions and Garlic", "Mushrooms"]
}


def user_get_meals(request):
    res=nutrients_list.objects.filter(USER__LOGIN_id=request.session['lid'])
    data=[]
    for i in res:
        data.append(i.nutrient)
    st=", ".join(data)
    return render(request, "user/meal_pred1.html", {'data':st})
    # return render(request, "user/get_meals.html")

def create_profile(request):

        favfood = request.POST['favfood']
        foodtype = request.POST['food']

        diet = request.POST.getlist('diet')
        print(diet)

        nutrient = request.POST.getlist('nutrient')
        print(nutrient)
        disease = request.POST.getlist('disease')
        print(disease)

        from .profile import Profile
        # prfl = Profile([diet], [disease], [nutrient], [foodtype], favfood)
        prfl = Profile(diet, disease, [nutrient], [foodtype], favfood)
        pd=prfl.get_profile()
        # data=[]
        # for i in range(pd.shape[0]):
        #     inner_data=[]
        #     for j in range(pd.shape[1]):
        #         inner_data.append(pd[i][j])
        #     data.append(inner_data)
        # print(data)
        lst=pd.values.tolist()

        print("Recommendations : ")
        print(lst)
        data=[]
        for i in lst:
            i.pop(1)
            i.pop(2)
            data.append(i)

        res = nutrients_list.objects.filter(USER__LOGIN_id=request.session['lid'])
        lst = []
        for i in res:
            lst.append(i.nutrient)
        st = ", ".join(lst)
        return render(request, "user/meal_pred1.html", {'data':st, 'data2':data})



# def create_profile(request):
#
#         favfood = request.POST['favfood']
#         foodtype = request.POST['food']
#
#         diet = request.POST['diet']
#
#         nutrient = request.POST['nutrient']
#         disease = request.POST['disease']
#
#         from .profile import Profile
#         prfl = Profile([diet], [disease], [nutrient], [foodtype], favfood)
#         pd=prfl.get_profile()
#         # data=[]
#         # for i in range(pd.shape[0]):
#         #     inner_data=[]
#         #     for j in range(pd.shape[1]):
#         #         inner_data.append(pd[i][j])
#         #     data.append(inner_data)
#         # print(data)
#         lst=pd.values.tolist()
#
#         print("Recommendations : ")
#         print(lst)
#         data=[]
#         for i in lst:
#             i.pop(1)
#             i.pop(2)
#             data.append(i)
#
#         res = nutrients_list.objects.filter(USER__LOGIN_id=request.session['lid'])
#         lst = []
#         for i in res:
#             lst.append(i.nutrient)
#         st = ", ".join(lst)
#         return render(request, "user/meal_pred.html", {'data':st, 'data2':data})



# def user_get_meals_post(request):
#     health_condition= request.POST['radio']
#
#     protein = random.choice(protein_options[health_condition])
#     fat = random.choice(fat_options[health_condition])
#     grain = random.choice(grain_options[health_condition])
#     vegetables = random.sample(vegetable_options[health_condition], 2)
#     vegetables = ", ".join(vegetables)
#
#     return render(request, "user/get_meals.html", {'protein':protein, 'fat':fat, 'grain':grain,
#                         'vegetables':vegetables})


def user_send_vol_req(request):
    res=volunteer_request.objects.filter(USER=user.objects.get(LOGIN_id=request.session['lid']), status="pending")
    if res.exists():
        return HttpResponse(
            "<script>alert('Already requested');window.location='/user_home';</script>")
    else:
        obj=volunteer_request()
        obj.USER=user.objects.get(LOGIN_id=request.session['lid'])
        obj.status="pending"
        obj.date=datetime.datetime.now().date()
        obj.save()
        return HttpResponse(
            "<script>alert('Successfully requested');window.location='/user_home';</script>")

def user_view_vol_req(request):
    res = volunteer_request.objects.filter(USER=user.objects.get(LOGIN_id=request.session['lid']))
    data=[]
    for i in res:
        res2=request_alloc.objects.filter(REQUEST=i)
        if res2.exists():
            res2=res2[0]
            data.append({
                'date':i.date, "id":i.id, "status":i.status, "vol_name":res2.VOLUNTEER.name,  "vol_phone":res2.VOLUNTEER.phone
            })
        else:
            data.append({
                'date': i.date, "id": i.id, "status": i.status, "vol_name": "Not Assigned",
                "vol_phn": "Not Assigned"
            })
    return render(request, "user/view_vol_request_status.html", {'data':data})

def user_del_vol_req(request, id):
    volunteer_request.objects.filter(id=id).delete()
    return redirect("/user_view_vol_req")

def user_send_suggestion(request):
    return render(request, "user/add_suggestion.html")

def user_send_suggestion_post(request):
    sugg=request.POST['t1']
    obj=suggestions()
    obj.date=datetime.datetime.now().date()
    obj.type="user"
    obj.suggestion=sugg
    obj.LOGIN=login.objects.get(id=request.session['lid'])
    obj.save()
    return HttpResponse(
        "<script>alert('Suggestion sent');window.location='/user_send_suggestion';</script>")