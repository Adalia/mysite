# coding:utf-8
from django.db import models
from django.contrib.auth.models import User
import markdown
from django.utils.html import strip_tags
from django.utils.six import python_2_unicode_compatible
from django.urls import reverse

# Create your models here.
# 每一个类相当于一个数据库表

class Category(models.Model):
    categoryname = models.CharField(max_length=50, unique=True)

class Tag(models.Model):
    tagname = models.CharField(max_length=50, unique=True)

class Blog(models.Model):
    title = models.CharField(max_length=70)  # 标题
    content = models.TextField()  # 正文
    excerpt = models.CharField(max_length=100, blank=True)  # 摘要
    tag = models.ManyToManyField(Tag, blank=True)
    category = models.ForeignKey(Category,on_delete=models.CASCADE)  # on_delete有CASCADE、PROTECT、SET_NULL、SET_DEFAULT、SET()五个可选择的值
    author = models.ForeignKey(User, on_delete=models.CASCADE)  # django.contrib.auth 是 Django 内置的应用，专门用于处理网站用户的注册、登录等流程，User 是 Django 为我们已经写好的用户模型。
    created_time = models.DateTimeField(auto_now_add=True)
    modified_time = models.DateTimeField(auto_now_add=True)
    views = models.PositiveIntegerField(default=0)
    # 重写save方法，实现自动填充摘要
    def save(self, *args, **kwargs):
        # 如果没有填写摘要
        if not self.excerpt:
            # 首先实例化一个 Markdown 类，用于渲染 body 的文本
            md = markdown.Markdown(extensions=[
                'markdown.extensions.extra',
                'markdown.extensions.codehilite',
            ])
            # 先将 Markdown 文本渲染成 HTML 文本
            # strip_tags 去掉 HTML 文本的全部 HTML 标签
            # 从文本摘取前 54 个字符赋给 excerpt
            self.excerpt = strip_tags(md.convert(self.content))[:54]

        # 调用父类的 save 方法将数据保存到数据库中
        super(Blog, self).save(*args, **kwargs)

    def increase_views(self):
        self.views += 1
        self.save(update_fields=['views'])

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('blog:detail', kwargs={'pk': self.pk})  # 这里的参数名字需要与url中的一致

    class Meta:
        app_label = "blog"
        ordering = ['-created_time', 'title'] #指定排序方式


# python_2_unicode_compatible 装饰器用于兼容 Python2
@python_2_unicode_compatible
class Comment(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField(max_length=255)
    url = models.URLField(blank=True)
    text = models.TextField()
    created_time = models.DateTimeField(auto_now_add=True)

    post = models.ForeignKey('blog.Blog',on_delete="CASCADE")

    def __str__(self):
        return self.text[:20]

    class Meta:
        app_label = "blog"
        ordering = ['-created_time'] #指定排序方式


class Author(models.Model):
    name = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    phone = models.CharField(max_length=50)
    education = models.CharField(max_length=50)
