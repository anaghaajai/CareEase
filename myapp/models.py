from django.db import models

# Create your models here.
class login(models.Model):
    username=models.CharField(max_length=200)
    password=models.CharField(max_length=200)
    usertype=models.CharField(max_length=200)

class medicine(models.Model):
    med_name=models.CharField(max_length=200)
    description=models.CharField(max_length=200)

class symptoms(models.Model):
    symptom_name=models.CharField(max_length=200)
    details=models.CharField(max_length=200)

class symptom_option(models.Model):
    option_name=models.CharField(max_length=200)
    SYMPTOMS=models.ForeignKey(symptoms, on_delete=models.CASCADE)

class user(models.Model):
    user_name=models.CharField(max_length=200)
    email=models.CharField(max_length=200)
    phone=models.BigIntegerField()
    place=models.CharField(max_length=200)
    pin=models.IntegerField()
    post=models.CharField(max_length=200)
    certificate=models.CharField(max_length=200)
    LOGIN=models.ForeignKey(login,default=1,on_delete=models.CASCADE)

class volunteer(models.Model):
    name=models.CharField(max_length=200)
    email=models.CharField(max_length=200)
    phone=models.BigIntegerField()
    experience=models.CharField(max_length=200)
    LOGIN=models.ForeignKey(login,default=1,on_delete=models.CASCADE)

class volunteer_request(models.Model):
    date=models.CharField(max_length=200)
    status=models.CharField(max_length=200)
    USER=models.ForeignKey(user,default=1,on_delete=models.CASCADE)

class request_alloc(models.Model):
    status=models.CharField(max_length=200)
    REQUEST=models.ForeignKey(volunteer_request,default=1,on_delete=models.CASCADE)
    VOLUNTEER=models.ForeignKey(volunteer,default=1,on_delete=models.CASCADE)


class doctor(models.Model):
    name=models.CharField(max_length=200)
    email=models.CharField(max_length=200)
    phone=models.BigIntegerField()
    specialization=models.CharField(max_length=200)
    experience=models.CharField(max_length=200)
    LOGIN=models.ForeignKey(login,default=1,on_delete=models.CASCADE)

class schedule(models.Model):
    date=models.CharField(max_length=200)
    from_time=models.CharField(max_length=200)
    to_time=models.CharField(max_length=200)
    DOCTOR=models.ForeignKey(doctor,default=1,on_delete=models.CASCADE)

class booking(models.Model):
    date=models.CharField(max_length=200)
    token=models.IntegerField(default=1)
    SCHEDULE=models.ForeignKey(schedule,default=1,on_delete=models.CASCADE)
    USER=models.ForeignKey(user,default=1,on_delete=models.CASCADE)

class symptom_logs(models.Model):
    date=models.CharField(max_length=100)
    SYMPTOM_OPTION=models.ForeignKey(symptom_option, on_delete=models.CASCADE)
    USER=models.ForeignKey(user,default=1,on_delete=models.CASCADE)

class items(models.Model):
    title=models.CharField(max_length=100)
    description=models.CharField(max_length=100)
    image=models.CharField(max_length=100)
    status=models.CharField(max_length=100)
    USER=models.ForeignKey(user,default=1,on_delete=models.CASCADE)

class item_request(models.Model):
    status=models.CharField(max_length=100)
    ITEM=models.ForeignKey(items,default=1,on_delete=models.CASCADE)
    USER=models.ForeignKey(user,default=1,on_delete=models.CASCADE)

class prescription(models.Model):
    dosage=models.CharField(max_length=100)
    MEDICINE=models.ForeignKey(medicine, on_delete=models.CASCADE)
    BOOKING=models.ForeignKey(booking,default=1,on_delete=models.CASCADE)

class question_table(models.Model):
    question=models.CharField(max_length=500)
    answer=models.CharField(max_length=2000)

class chat(models.Model):
    message=models.CharField(max_length=300)
    type=models.CharField(max_length=50)
    LOGIN=models.ForeignKey(login, on_delete=models.CASCADE)

class posts(models.Model):
    date=models.DateField()
    title=models.CharField(max_length=1000)
    image=models.CharField(max_length=200)
    USER=models.ForeignKey(user,default=1,on_delete=models.CASCADE)

class comments(models.Model):
    date=models.DateField()
    comment=models.CharField(max_length=500)
    POSTS=models.ForeignKey(posts,default=1,on_delete=models.CASCADE)
    USER=models.ForeignKey(user,default=1,on_delete=models.CASCADE)

class suggestions(models.Model):
    date=models.CharField(max_length=100)
    suggestion=models.CharField(max_length=500)
    type=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(login, on_delete=models.CASCADE)

class nutrients_list(models.Model):
    nutrient=models.CharField(max_length=100)
    USER=models.ForeignKey(user,default=1,on_delete=models.CASCADE)