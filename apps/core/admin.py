from django.contrib import admin
from .models import NewsPost, TemplateBaiViet, LoaiTin, LoaiBDS, Tinh, QuanHuyen, PhuongXa, DuongPho, DuAn, Contact, Huong, PhapLy
from django.utils.html import format_html
# Register your models here.

admin.site.register(LoaiBDS)
admin.site.register(LoaiTin)
admin.site.register(Huong)
admin.site.register(PhapLy)

def auto_post(modeladmin, request, queryset):
    pass

auto_post.short_description = "Tự Động Đăng Bài trang1"

class PostAdmin(admin.ModelAdmin):
    def image_tag(self, obj):
        return format_html('<img width="60" height="40"  src="/media/{}" />'.format(obj.anh_1))

    image_tag.short_description = 'Image'

    def image_tag2(self, obj):
        return format_html('<img width="60" height="40"  src="/media/{}" />'.format(obj.anh_2))

    image_tag2.short_description = 'Image2'

    list_display = (
        'id', 'title', 'gia_tien','trang_thai_nha', 'dia_chi', 'image_tag', 'image_tag2'
    )
    
    list_display_links = ['id', 'title']
    actions = [auto_post]

admin.site.register(NewsPost, PostAdmin)
admin.site.register(TemplateBaiViet)

admin.site.site_header = "HTC Land"
admin.site.site_title = "HTC Land"
admin.site.index_title = "Quản trị HTC LAND"