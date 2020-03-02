from rest_framework import serializers
from .models import NewsPost


class GetAllCourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = NewsPost
        fields = ('id', 'title')
