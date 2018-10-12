# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render

# Create your views here.
from rest_framework.response import Response
from rest_framework.viewsets import ViewSet

from .w_lib.file_util import cfg_get
import json

class GroupInfo(ViewSet):
    """
    demo
    """
    def list(self, request, *args, **kwargs):
        filename="data/config"
        groupinfo_str = cfg_get(filename,"groupinfo")
        groupinfo = json.loads(groupinfo_str)
        return Response(groupinfo)
