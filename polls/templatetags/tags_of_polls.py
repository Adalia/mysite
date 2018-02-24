from django import template
from polls.models import Question


register = template.Library()


@register.simple_tag
def get_recent_posts(num=5):
    return Question.objects.all().order_by('-pub_date')[:num]