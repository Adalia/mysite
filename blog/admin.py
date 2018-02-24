from django.contrib import admin

# Register your models here.
# coding:utf-8
from django.contrib import admin

# Register your models here.

from blog import models

#在 admin post 列表页面，我们只看到了文章的标题，但是我们希望它显示更加详细的信息，这需要我们来定制 Admin
class BlogAdmin(admin.ModelAdmin):
    list_display = ['title', 'created_time', 'modified_time', 'category', 'author']

class CategoryAdmin(admin.ModelAdmin):
    list_display = ['id', 'categoryname']

class TagAdmin(admin.ModelAdmin):
    list_display = ['id', 'tagname']

admin.site.register(models.Author)
admin.site.register(models.Blog, BlogAdmin)
admin.site.register(models.Category,CategoryAdmin)
admin.site.register(models.Tag,TagAdmin)