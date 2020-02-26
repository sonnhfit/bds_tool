from django.contrib import admin
from .models import NewsPost
# Register your models here.


def auto_post(modeladmin, request, queryset):
    pass

auto_post.short_description = "Tự Động Đăng Bài trang1"

class PostAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'title', 'gia_tien','trang_thai_nha'
    )
    list_display_links = ['id', 'title']
    actions = [auto_post]

admin.site.register(NewsPost, PostAdmin)