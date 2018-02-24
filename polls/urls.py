#coding:utf-8
from django.urls import path
from . import views


app_name = 'polls'  #  add app_name to set the application namespace,path中的那么是反向引用url的，引用方式 polls:detail
urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    path('<int:pk>/', views.DetailView.as_view(), name='detail'),  #Django提供了一个pk字段来表示主键
    path('<int:question_id>/vote/', views.vote, name='vote'),
    path('<int:pk>/results/', views.ResultsView.as_view(), name='results'),

    # ex: /polls/5/
    #path('<int:question_id>/', views.detail, name='detail'),

    # ex: /polls/5/results/
    #path('<int:question_id>/results/', views.results, name='results'),
    # path('<int:pk>/results/', views.results, name='results'),
    # ex: /polls/5/vote/
]



'''
When somebody requests a page from your website
 – say, “/polls/34/”, Django will load the mysite.urls 
 Python module because it’s pointed to by the ROOT_URLCONF 
 setting. It finds the variable named urlpatterns and traverses 
 the patterns in order. After finding the match at 'polls/', 
 it strips off the matching text ("polls/") and sends the 
 remaining text – "34/" – to the ‘polls.urls’ URLconf for 
 further processing. There it matches '<int:question_id>/', 
 resulting in a call to the detail() view like so:
'''

