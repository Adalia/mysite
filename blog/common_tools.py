import markdown
'''
def content_to_markdown(content):
    markdown_content = markdown.markdown(content,
             extensions=[
                 'markdown.extensions.extra',
                 'markdown.extensions.codehilite',   # 代码高亮
                 'markdown.extensions.toc',  # 自动生成目录
             ])
    return markdown_content


'''
def content_to_markdown(content):
    md = markdown.Markdown(extensions=[
                 'markdown.extensions.extra',
                 'markdown.extensions.codehilite',   # 代码高亮
                 'markdown.extensions.toc',  # 自动生成目录
             ])
    markdown_content = md.convert(content)
    content_toc = md.toc

    return {"content" : markdown_content, "toc": content_toc}
