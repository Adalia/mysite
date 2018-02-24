# coding:utf8
from django.urls import path
from . import views

app_name = 'blog'
urlpatterns = [
    # 基于类视图的url
    path('', views.IndexView.as_view()),
    path('about/',views.about),
    path('<int:pk>/', views.BlogDetailView.as_view(), name='detail'),  # 这种类型的模板必须传递的参数是pk
    path('archives/<int:year>/<int:month>/', views.ArchivesView.as_view(), name='archives'),

    # views.py中通用视图中获取cate = get_object_or_404(Category, categoryname=self.kwargs.get('category_name'))，
    # 自定义函数获取：def category(request, category_name)：
    path('category/<str:category_name>/', views.CategoryView.as_view(), name='category'),
    path('<int:blog_id>/comment/', views.blog_comment, name='comment'),
]


# 基于普通视图的url
'''
  path('',views.blog),
  path('about/',views.about),
  path('<int:blog_id>/', views.detail, name='detail'),
  path('archives/<int:year>/<int:month>/', views.archives, name='archives'),
  path('category/<str:category_name>/', views.category, name='category'),
  '''
