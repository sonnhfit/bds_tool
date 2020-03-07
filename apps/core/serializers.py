from rest_framework import serializers
from .models import NewsPost


class GetAllCourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = NewsPost
        fields = ('id', 'title', 'desc', 'gia_tien', 'dientich', 'sotang', 
        'so_phong_ngu', 'co_mat_tien', 'mattien', 'dia_chi', 'trang_thai_nha', 
        'co_nha_bep', 'co_phong_an', 'co_san_thuong', 'co_cho_de_xe_hoi', 'loai_tin', 'loai_bds', 'phaply'
        )
