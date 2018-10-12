#!/usr/bin/python
#coding=utf8
"""
# Author: meetbill
# Created Time : 2017-12-01 02:05:22

# File Name: urls.py
# Description:

"""
from django.conf.urls import url, include
from rest_framework import routers

import views

router = routers.DefaultRouter()
router.register(r'groupinfo',views.GroupInfo,'groupinfo')

urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^auth/', include('rest_framework.urls'))
        ]
