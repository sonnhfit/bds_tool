from django.shortcuts import render
from rest_framework.views import exception_handler as drf_exception_handler
# Create your views here.
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from apps.core.utils import validate_data
from rest_framework import status
from .models import NewsPost
from .serializers import GetAllCourseSerializer

def exception_handler(exc, context):
    response = drf_exception_handler(exc, context)
    return response


class GetAllNewsPost(APIViews):
    permission_classes = (permissions.AllowAny,)

    def get(self, request):
        data1 = NewsPost.objects.all()
        mydata = GetAllCourseSerializer(data1, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)
