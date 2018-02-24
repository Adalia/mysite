
# Create your views here.
from django.shortcuts import render, get_object_or_404
from blog.models import Blog, Category
from django.views.generic import ListView,DetailView
from django.shortcuts import render, get_object_or_404, redirect
from django.core.paginator import Paginator
from .forms import CommentForm
from blog import common_tools

# 基于通用视图
class IndexView(ListView):
    model = Blog
    template_name = 'blog/index.html'
    context_object_name = 'blog_list'

    paginate_by = 2  # django的Listview带的属性，也可以自己写

    def get_context_data(self, **kwargs):# 此函数是要给模板返回的变量中添加一些我们的自定义变量

        context = super().get_context_data(**kwargs)
        print(context)

        paginator = context.get('paginator')
        page = context.get('page_obj')
        is_paginated = context.get('is_paginated')

        pagination_data = self.pagination_data(paginator, page, is_paginated)
        context.update(pagination_data)
        return context

    def pagination_data(self, paginator, page, is_paginated):
        if not is_paginated: # 如果没有分页
            return {}

        left = []   # 当前页左边连续的页码号，初始值为空
        right = []  # 当前页右边连续的页码号，初始值为空

        left_has_more = False # 标示第 1 页页码后是否需要显示省略号

        right_has_more = False  # 标示最后一页页码前是否需要显示省略号

        # 标示是否需要显示第 1 页的页码号。
        # 因为如果当前页左边的连续页码号中已经含有第 1 页的页码号，此时就无需再显示第 1 页的页码号，
        # 其它情况下第一页的页码是始终需要显示的。
        # 初始值为 False
        first = False

        # 标示是否需要显示最后一页的页码号。
        # 需要此指示变量的理由和上面相同。
        last = False

        # 获得用户当前请求的页码号
        page_number = page.number

        # 获得分页后的总页数
        total_pages = paginator.num_pages

        # 获得整个分页页码列表，比如分了四页，那么就是 [1, 2, 3, 4]
        page_range = paginator.page_range

        if page_number == 1:
            # 如果用户请求的是第一页的数据，那么当前页左边的不需要数据，因此 left=[]（已默认为空）。
            # 此时只要获取当前页右边的连续页码号，
            # 比如分页页码列表是 [1, 2, 3, 4]，那么获取的就是 right = [2, 3]。
            # 注意这里只获取了当前页码后连续两个页码，你可以更改这个数字以获取更多页码。
            right = page_range[page_number:page_number + 2]

            # 如果最右边的页码号比最后一页的页码号减去 1 还要小，
            # 说明最右边的页码号和最后一页的页码号之间还有其它页码，因此需要显示省略号，通过 right_has_more 来指示。
            if right[-1] < total_pages - 1:
                right_has_more = True

            # 如果最右边的页码号比最后一页的页码号小，说明当前页右边的连续页码号中不包含最后一页的页码
            # 所以需要显示最后一页的页码号，通过 last 来指示
            if right[-1] < total_pages:
                last = True

        elif page_number == total_pages:
            # 如果用户请求的是最后一页的数据，那么当前页右边就不需要数据，因此 right=[]（已默认为空），
            # 此时只要获取当前页左边的连续页码号。
            # 比如分页页码列表是 [1, 2, 3, 4]，那么获取的就是 left = [2, 3]
            # 这里只获取了当前页码后连续两个页码，你可以更改这个数字以获取更多页码。
            left = page_range[(page_number - 3) if (page_number - 3) > 0 else 0:page_number - 1]

            # 如果最左边的页码号比第 2 页页码号还大，
            # 说明最左边的页码号和第 1 页的页码号之间还有其它页码，因此需要显示省略号，通过 left_has_more 来指示。
            if left[0] > 2:
                left_has_more = True

            # 如果最左边的页码号比第 1 页的页码号大，说明当前页左边的连续页码号中不包含第一页的页码，
            # 所以需要显示第一页的页码号，通过 first 来指示
            if left[0] > 1:
                first = True
        else:
            # 用户请求的既不是最后一页，也不是第 1 页，则需要获取当前页左右两边的连续页码号，
            # 这里只获取了当前页码前后连续两个页码，你可以更改这个数字以获取更多页码。
            left = page_range[(page_number - 3) if (page_number - 3) > 0 else 0:page_number - 1]
            right = page_range[page_number:page_number + 2]

            # 是否需要显示最后一页和最后一页前的省略号
            if right[-1] < total_pages - 1:
                right_has_more = True
            if right[-1] < total_pages:
                last = True

            # 是否需要显示第 1 页和第 1 页后的省略号
            if left[0] > 2:
                left_has_more = True
            if left[0] > 1:
                first = True

        data = {
            'left': left,
            'right': right,
            'left_has_more': left_has_more,
            'right_has_more': right_has_more,
            'first': first,
            'last': last,
        }

        return data

class CategoryView(ListView):
    model = Blog
    template_name = 'blog/index.html'
    context_object_name = 'blog_list'
    # get_queryset 方法默认获取指定模型的全部列表数据。覆写该方法，改变它的默认行为。

    def get_queryset(self):
        cate = get_object_or_404(Category, categoryname=self.kwargs.get('category_name'))  # 获取url中的参数，名称要一致path('category/<str:category_name>/', views.CategoryView.as_view(), name='category')
        print("*********************")
        print(cate.categoryname)
        return super(CategoryView, self).get_queryset().filter(category=cate)

class ArchivesView(IndexView):
    def get_queryset(self):
        year = self.kwargs.get('year')
        month = self.kwargs.get('month')
        print("*********************")
        print(year)
        print(month)
        return super(ArchivesView, self).get_queryset().filter(created_time__year=year, created_time__month=month)

class BlogDetailView(DetailView):
    # 这些属性的含义和 ListView 是一样的
    model = Blog
    template_name = 'blog/detail.html'
    context_object_name = 'blog'

    def get(self, request, *args, **kwargs):
        # 覆写 get 方法的目的是因为每当文章被访问一次，就得将文章阅读量 +1
        # get 方法返回的是一个 HttpResponse 实例
        # 之所以需要先调用父类的 get 方法，是因为只有当 get 方法被调用后，
        # 才有 self.object 属性，其值为 Post 模型实例，即被访问的文章 post
        response = super(BlogDetailView, self).get(request, *args, **kwargs)

        # 将文章阅读量 +1
        # 注意 self.object 的值就是被访问的文章 post
        self.object.increase_views()

        # 视图必须返回一个 HttpResponse 对象
        return response

    def get_object(self, queryset=None):
        # 覆写 get_object 方法的目的是因为需要对 post 的 body 值进行渲染
        blog = super(BlogDetailView, self).get_object(queryset=None)
        md = common_tools.content_to_markdown(blog.content)
        blog.content = md.get("content")
        blog.toc = md.get("toc")
        return blog

    def get_context_data(self, **kwargs):
        # 覆写 get_context_data 的目的是因为除了将 post 传递给模板外（DetailView 已经帮我们完成），
        # 还要把评论表单、post 下的评论列表传递给模板。
        context = super(BlogDetailView, self).get_context_data(**kwargs)

        form = CommentForm()
        comment_list = self.object.comment_set.all()
        context.update({
                   'form': form,
                   'comment_list': comment_list
                   })
        return context

def about(request):
    return render(request, 'blog/about.html')

def blog_comment(request, blog_id):
    # 先获取被评论的文章，因为后面需要把评论和被评论的文章关联起来。
    # 这里我们使用了 Django 提供的一个快捷函数 get_object_or_404，
    # 这个函数的作用是当获取的文章（Post）存在时，则获取；否则返回 404 页面给用户。
    blog = get_object_or_404(Blog, pk=blog_id)

    # HTTP 请求有 get 和 post 两种，一般用户通过表单提交数据都是通过 post 请求，
    # 因此只有当用户的请求为 post 时才需要处理表单数据。
    if request.method == 'POST':
        # 用户提交的数据存在 request.POST 中，这是一个类字典对象。
        # 我们利用这些数据构造了 CommentForm 的实例，这样 Django 的表单就生成了。
        form = CommentForm(request.POST)

        # 当调用 form.is_valid() 方法时，Django 自动帮我们检查表单的数据是否符合格式要求。
        if form.is_valid():
            # 检查到数据是合法的，调用表单的 save 方法保存数据到数据库，
            # commit=False 的作用是仅仅利用表单的数据生成 Comment 模型类的实例，但还不保存评论数据到数据库。
            comment = form.save(commit=False)

            # 将评论和被评论的文章关联起来。
            comment.post = blog

            # 最终将评论数据保存进数据库，调用模型实例的 save 方法
            comment.save()

            # 重定向到 post 的详情页，实际上当 redirect 函数接收一个模型的实例时，它会调用这个模型实例的 get_absolute_url 方法，
            # 然后重定向到 get_absolute_url 方法返回的 URL。
            return redirect(blog)

        else:
            # 检查到数据不合法，重新渲染详情页，并且渲染表单的错误。
            # 因此我们传了三个模板变量给 detail.html，
            # 一个是文章（Post），一个是评论列表，一个是表单 form
            # 注意这里我们用到了 post.comment_set.all() 方法，
            # 这个用法有点类似于 Post.objects.all()
            # 其作用是获取这篇 post 下的的全部评论，
            # 因为 Post 和 Comment 是 ForeignKey 关联的，
            # 因此使用 post.comment_set.all() 反向查询全部评论。
            # 具体请看下面的讲解。
            comment_list = blog.comment_set.all()
            md = common_tools.content_to_markdown(blog.content)
            blog.content = md.get("content")
            blog.toc = md.get("toc")
            context = {'blog': blog,
                       'form': form,
                       'comment_list': comment_list
                       }
            return render(request, 'blog/detail.html', context=context)
    # 不是 post 请求，说明用户没有提交数据，重定向到文章详情页。
    return redirect(blog)  #redirect 既可以接收一个 URL 作为参数，也可以接收一个模型的实例作为参数（例如这里的 post）。如果接收一个模型的实例，那么这个实例必须实现了 get_absolute_url 方法，这样 redirect 会根据 get_absolute_url 方法返回的 URL 值进行重定向。



# 原始的视图函数
'''
def blog(request):
    blog_list = Blog.objects.all().order_by('-created_time')
    return render(request, 'blog/index.html',{'blog_list':blog_list}) 
    
    
def category(request, category_name):
    # 记得在开始部分导入 Category 类
    #cate = get_object_or_404(Category, pk=pk)
    #post_list = Blog.objects.filter(category=cate).order_by('-created_time')
    cate = get_object_or_404(Category, categoryname=category_name)
    #blog_list = Blog.objects.filter(category=cate).order_by('-created_time')
    blog_list = Blog.objects.filter(category=cate) # 由于在模型中指定了排序方式，所以不需要再排序
    return render(request, 'blog/index.html', context={'blog_list': blog_list})
    
    
def archives(request, year, month):
    #created_time 是 Python 的 date 对象，其有一个 year 和 month 属性
    #When USE_TZ is True, datetime fields are converted to the current time zone before filtering.需要设置成False)
    blog_list = Blog.objects.filter(created_time__year=year, created_time__month=month)
    return render(request, 'blog/index.html', context={'blog_list': blog_list})
    
    
    def detail(request, blog_id):
    blog = get_object_or_404(Blog, pk=blog_id)
    blog.content = markdown.markdown(blog.content,
                                  extensions=[
                                      'markdown.extensions.extra',
                                      'markdown.extensions.codehilite',
                                      'markdown.extensions.toc',
                                  ])
    return render(request, 'blog/detail.html',{'blog': blog})
    
    

def detail(request, blog_id):  # blog_id是url中传的参数名称
    blog = get_object_or_404(Blog, pk=blog_id)

    blog.content = common_tools.content_to_markdown(blog.content)
    form = CommentForm()
    comment_list = blog.comment_set.all()
    context = {'blog': blog,
               'form': form,
               'comment_list': comment_list
               }
    return render(request, 'blog/detail.html', context=context)
'''









