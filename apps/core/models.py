from django.db import models
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField

# Create your models here.

class LoaiTin(models.Model):
    name = models.CharField(max_length=200)


class LoaiBDS(models.Model):
    name = models.CharField(max_length=200)

class Tinh(models.Model):
    code = models.IntegerField(default=0)
    name = models.CharField(max_length=200)


class QuanHuyen(models.Model):
    code = models.IntegerField(default=0)
    name = models.CharField(max_length=200)
    tinh = models.ForeignKey(Tinh, on_delete=models.CASCADE)


class PhuongXa(models.Model):
    code = models.IntegerField(default=0)
    name = models.CharField(max_length=200)
    huyen = models.ForeignKey(QuanHuyen, on_delete=models.CASCADE)

class DuongPho(models.Model):
    code = models.IntegerField(default=0)
    name = models.CharField(max_length=200)
    phuongxa = models.ForeignKey(PhuongXa, on_delete=models.CASCADE)


class DuAn(models.Model):
    code = models.IntegerField(default=0)
    name = models.CharField(max_length=200)
    phuongxa = models.ForeignKey(DuongPho, on_delete=models.CASCADE)


class Contact(models.Model):
    name = models.CharField(max_length=200)
    dienthoai = models.CharField(max_length=200)


class Huong(models.Model):
    name = models.CharField(max_length=200)

class PhapLy(models.Model):
    name = models.CharField(max_length=200)

class NewsPost(models.Model):
    TRANG_THAI_NHA = [
        (False, "Nhà chưa bán"),
        (True, "Nhà đã bán")
    ]
    title = models.CharField(max_length=200, verbose_name = "Tiêu đề")
    desc = RichTextUploadingField(default='', verbose_name = "Mô tả", blank=True)
    gia_tien = models.FloatField(verbose_name = "Giá tiền")
    dientich = models.IntegerField(verbose_name = "Diện tích")
    sotang = models.IntegerField(verbose_name = "Số tầng")
    so_phong_ngu = models.IntegerField(default=0, verbose_name = "Số phòng ngủ")
    co_mat_tien = models.BooleanField(default=False)
    mattien = models.FloatField(verbose_name = "Mặt tiền") #so met mat tien, đường trước nhà

    dia_chi = models.CharField(max_length=200, verbose_name = "Địa chỉ")

    trang_thai_nha = models.BooleanField(default=False, verbose_name = "Trạng thái nhà")

    co_nha_bep = models.BooleanField(default=False, verbose_name = "Có nhà bếp")
    co_phong_an = models.BooleanField(default=False, verbose_name = "Có phòng ăn")
    co_san_thuong = models.BooleanField(default=False, verbose_name = "Có sân thượng")
    co_cho_de_xe_hoi = models.BooleanField(default=False, verbose_name = "Có chỗ để xe hơi")

    loai_tin = models.ForeignKey(LoaiTin, on_delete=models.SET_NULL, verbose_name = "Loại tin", null=True, blank=True)
    loai_bds = models.ForeignKey(LoaiBDS, on_delete=models.SET_NULL, verbose_name = "Loại BDS", null=True, blank=True)
    phaply = models.ForeignKey(PhapLy, on_delete=models.SET_NULL, verbose_name = "Pháp lý", null=True, blank=True)
     

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


