
from django import template
from blog.models import Blog, Category, Tag
from django.db.models.aggregates import Count

register = template.Library()


@register.simple_tag
def get_recent_blogs(num=5):
    return Blog.objects.all().order_by('-created_time')[:num]


@register.simple_tag
def archives():
    return Blog.objects.dates('created_time', 'month', order='DESC')


@register.simple_tag
def get_categories():
    return Category.objects.annotate(num_blogs=Count('blog')).filter(num_blogs__gt=0)

@register.simple_tag
def get_tags():
    # Count 计算分类下的文章数，其接受的参数为需要计数的模型的名称
    return Tag.objects.annotate(num_blogs=Count('blog')).filter(num_blogs__gt=0)