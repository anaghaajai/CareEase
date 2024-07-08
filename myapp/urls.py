"""
URL configuration for palliative project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from myapp import views

urlpatterns = [
    path('', views.logg),
    path('logg_post', views.logg_post),
    path('admin_home', views.admin_home),
    path('admin_add_med', views.admin_add_med),
    path('admin_add_med_post', views.admin_add_med_post),
    path('admin_view_med', views.admin_view_med),
    path('admin_delete_med/<id>', views.admin_delete_med),
    path('admin_add_symp', views.admin_add_symp),
    path('admin_add_symp_post', views.admin_add_symp_post),
    path('admin_view_symp', views.admin_view_symp),
    path('admin_delete_symp/<id>', views.admin_delete_symp),
    path('admin_view_symptom_options/<id>', views.admin_view_symptom_options),
    path('admin_delete_symptom_options/<sid>/<id>', views.admin_delete_symptom_options),
    path('admin_add_options/<id>', views.admin_add_options),
    path('admin_view_users', views.admin_view_users),
    path('admin_view_volunteers', views.admin_view_volunteers),
    path('admin_delete_volunteers/<id>', views.admin_delete_volunteers),
    path('admin_add_volunteer', views.admin_add_volunteer),
    path('admin_add_volunteer_post', views.admin_add_volunteer_post),
    path('admin_view_vol_req', views.admin_view_vol_req),
    path('admin_allocate_vol/<id>', views.admin_allocate_vol),
    path('admin_allocate_vol_post/<id>', views.admin_allocate_vol_post),
    path('admin_view_request_status', views.admin_view_request_status),
    path('adm_view_user_suggestions', views.adm_view_user_suggestions),
    path('adm_view_doc_suggestions', views.adm_view_doc_suggestions),
    path('adm_del_suggestions/<id>', views.adm_del_suggestions),


    path('vol_home', views.vol_home),
    path('vol_profile', views.vol_profile),
    path('vol_profile_post', views.vol_profile_post),
    path('vol_allocated_request', views.vol_allocated_request),
    path('vol_update_status/<id>', views.vol_update_status),
    path('vol_update_status_post/<id>', views.vol_update_status_post),




    path('register', views.register),
    path('reg_post', views.reg_post),
    path('doc_home', views.doc_home),
    path('doc_profile', views.doc_profile),
    path('doc_profile_post', views.doc_profile_post),
    path('doc_view_sched', views.doc_view_sched),
    path('doc_delete_sched/<id>', views.doc_delete_sched),
    path('doc_add_schedule', views.doc_add_schedule),
    path('doc_add_schedule_post', views.doc_add_schedule_post),
    path('doc_view_bookings/<id>', views.doc_view_bookings),
    path('doc_view_nutrient_list/<id>', views.doc_view_nutrient_list),
    path('doc_delete_nutrients/<id>/<uid>', views.doc_delete_nutrients),
    path('doc_add_nutrient/<id>', views.doc_add_nutrient),
    path('doc_add_nutrient_post/<id>', views.doc_add_nutrient_post),
    path('doc_view_symptom_logs/<id>', views.doc_view_symptom_logs),
    path('doc_add_prescriptions/<id>', views.doc_add_prescriptions),
    path('doc_add_prescription_post/<id>', views.doc_add_prescription_post),
    path('doc_delete_prescription/<id>', views.doc_delete_prescription),
    path('doc_send_suggestion', views.doc_send_suggestion),
    path('doc_send_suggestion_post', views.doc_send_suggestion_post),
    path('logout', views.logout),

    path('user_reg', views.user_reg),
    path('user_reg_post', views.user_reg_post),
    path('user_home', views.user_home),
    path('user_profile', views.user_profile),
    path('user_profile_post', views.user_profile_post),
    path('user_view_symptom_logs', views.user_view_symptom_logs),
    path('user_graph', views.user_graph),
    path('user_delete_logs/<id>', views.user_delete_logs),
    path('user_view_symptoms', views.user_view_symptoms),
    path('user_view_symptom_level/<sid>', views.user_view_symptom_level),
    path('user_add_level/<oid>', views.user_add_level),
    path('user_view_my_items', views.user_view_my_items),
    path('user_delete_items/<id>', views.user_delete_items),
    path('user_add_items', views.user_add_items),
    path('user_add_items_post', views.user_add_items_post),
    path('user_view_request/<id>', views.user_view_request),
    path('user_approve_request/<id>', views.user_approve_request),
    path('user_reject_request/<id>', views.user_reject_request),
    path('user_view_others_items', views.user_view_others_items),
    path('user_send_request/<id>', views.user_send_request),
    path('user_view_request_status', views.user_view_request_status),
    path('user_view_doctors', views.user_view_doctors),
    path('user_view_schedules/<id>', views.user_view_schedules),
    path('user_book_appointment/<id>', views.user_book_appointment),
    path('user_view_bookings', views.user_view_bookings),
    path('user_view_prescriptions/<id>', views.user_view_prescriptions),
    path('chatbot', views.chatbot),
    path('chatbot_add_chat', views.chatbot_add_chat),
    path('chatbot_view_chat', views.chatbot_view_chat),
    path('chatbot_delete_chat', views.chatbot_delete_chat),
    path('user_view_pat_comm', views.user_view_pat_comm),
    path('user_add_comment/<id>', views.user_add_comment),
    path('user_add_comment_post/<id>', views.user_add_comment_post),
    path('add_post', views.add_post),
    path('add_post_pst', views.add_post_pst),
    path('user_get_meals', views.user_get_meals),
    path('create_profile', views.create_profile),
    # path('user_get_meals_post', views.user_get_meals_post),
    path('user_send_vol_req', views.user_send_vol_req),
    path('user_view_vol_req', views.user_view_vol_req),
    path('user_del_vol_req/<id>', views.user_del_vol_req),
    path('user_send_suggestion', views.user_send_suggestion),
    path('user_send_suggestion_post', views.user_send_suggestion_post),
]
