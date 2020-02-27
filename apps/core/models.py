from django.db import models
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField

# Create your models here.


class NewsPost(models.Model):
    TRANG_THAI_NHA = [
        (False, "Nhà chưa bán"),
        (True, "Nhà đã bán")
    ]
    title = models.CharField(max_length=200, verbose_name = "Tiêu đề")
    desc = RichTextUploadingField(default='', verbose_name = "Mô tả", blank=True)
    gia_tien = models.IntegerField(verbose_name = "Mô tả")
    dientich = models.IntegerField(verbose_name = "Diện tích")
    sotang = models.IntegerField(verbose_name = "Số tầng")
    co_mat_tien = models.BooleanField(default=False)
    mattien = models.FloatField(verbose_name = "Mặt tiền") #so met mat tien

    dia_chi = models.CharField(max_length=200, verbose_name = "Địa chỉ")

    trang_thai_nha = models.BooleanField(default=False, verbose_name = "Trạng thái nhà")

    anh_1 = models.ImageField(upload_to='anh_nha', null=True, blank=True)
    anh_2 = models.ImageField(upload_to='anh_nha', null=True, blank=True)
    anh_3 = models.ImageField(upload_to='anh_nha', null=True, blank=True)
    anh_4 = models.ImageField(upload_to='anh_nha', null=True, blank=True)
    anh_5 = models.ImageField(upload_to='anh_nha', null=True, blank=True)
    anh_5 = models.ImageField(upload_to='anh_nha', null=True, blank=True)
    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Nhà'
        verbose_name_plural = 'Nhà đất'
    
    # gia_tien = models.CharField(max_length=200)

    # da_ban = models.BooleanField(default=False)

class TemplateBaiViet(models.Model):
    baiviet = models.TextField(max_length=200, verbose_name = "Mô tả")

    class Meta:
        verbose_name = 'Mẫu tin'
        verbose_name_plural = 'Mẫu tin'
