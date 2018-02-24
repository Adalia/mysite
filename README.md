# mysite
参考教程：https://www.zmrenwu.com/post/2/

环境准备：

 ``` 
  windows 
  python == 3.6 
  Django2.0.2 (pip install Django2.0.2) # 将django-admin.exe添加到环境变量中 
  pip install pymysql 
  pip install markdown 
  pip install Pygments # Markdown 使用 Pygments 在后台为我们做了很多事。如果你打开博客详情页，找到一段代码段，在浏览器查看这段代码段的 HTML 源代码，可以发现 Pygments 的工作原理是把代码切分成一个个单词，然后为这些单词添加 css 样式，不同的词应用不同的样式，这样就实现了代码颜色的区分，即高亮了语法。为此，还差最后一步，引入一个样式文件来给这些被添加了样式的单词定义颜色。
```
操作步骤： 

创建项目：```django-admin.exe startproject projectname ```，例：mysite 

创建app	： 

进入项目目录：```cd projectname ```

创建：```django-admin.py startapp appname```，例：blog

配置app： ```mysite\mysite\setting.py`` 的INSTALLED_APPS项中添加app： 
```
INSTALLED_APPS = [ 
   'django.contrib.admin', 
   'django.contrib.auth', 
   'django.contrib.contenttypes', 
   'django.contrib.sessions', 
   'django.contrib.messages', 
   'django.contrib.staticfiles', 
   'blog', 
]
```

创建数据库： 安装mysql，安装server端就行，可视化界面可以选择navicate，连接之前需要授权 创建一个数据库，例：```mysite python manage.py migrate```

配置数据库： ```mysite\mysite\setting.py ```中修改DATABASES配置为： 
```
DATABASES = { 
  'default': { 
     'ENGINE': 'django.db.backends.mysql', 
     'NAME': 'mysite', 
     'USER': 'root', 
     'PASSWORD': 'root', 
     'HOST': '127.0.0.1', 
     'PORT':  '3306', 
     'OPTIONS': { 'autocommit': True, }, 
     }, 
    }
'''

```mysite\mysite_init_.py``` 中添加： ```import pymysql pymysql.install_as_MySQLdb()```


模板配置：	

建立一个放置模板（html）的目录-templates，目录级别：mysite\templates，与setting.py同级 配置模板路径：setting.py 的TEMPLATES项中的DIRS对应的values改为[BASE_DIR+"/templates"]

url配置： 1.在项目中配置app的主路径：D:\code\mysite\mysite\urls.oy中配置path('blog/', include('blog.urls'), name="blog")；2.在app的urls.py中（D:\code\mysite\blog\urls.py）中配置具体目录。

创建数据库表（模型）： 1.添加模型：D:\code\mysite\blog\models.py 中添加，每一个类代表一个数据库表； 2.迁移数据库：进入项目目录执行python manage.py makemigrations 和 python manage.py migrate

创建页面： 位置：D:\code\mysite\blog\templates

启动服务： 进入项目目录，执行：python manage.py runserver 0.0.0.0:8000

manage.py ： Django项目里面的工具，通过它可以调用django shell和数据库等。


备注： 1.标签的引用: html文件开头添加引用，例：{% load staticfiles %} html的引用：html文件开头添加引用例：{% extends 'base.html' %},需要在base.html中设置占位block，如{% block main %} {% endblock main %} 其他页面中需要使用此标签来告知base.html将此部分的html添加到何处。 2.修改admin密码： python manage.py shell from django.contrib.auth.models import User user = User.objects.get(username='admin') user.set_password('new_password') user.save() 3.自动生成摘要：重写model.py中Blog模型的save()方法。 4.分页：在views.py的IndexView中实现，django的通用视图中带分页属性。index.html中展示。 5.自定义标签，建立templatetags文件夹之后一定要重启服务。 6.目前能做的且推荐做的是使用外链引入图片。比如将图片上传到七牛云这样的云存储服务器，然后通过 Markdown 的图片语法将图片引入 7.Django 出于安全方面的考虑，任何的 HTML 代码在 Django 的模板中都会被转义（即显示原始的 HTML 代码，而不是经浏览器渲染后的格式）。为了解除转义，只需在模板标签使用 safe 过滤器即可。 {{ blog.content | safe }}
