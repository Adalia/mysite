# coding:utf-8
from django.shortcuts import render, get_object_or_404, get_list_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from django.db.models import F

from .models import  Question, Choice

def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:10]
    #output = ','.join([q.question_text for q in latest_question_list])
    context = {'latest_question_list':latest_question_list}
    print(latest_question_list)
    print(context.get('latest_question_list'))
    return render(request, 'polls/index.html', context)

def detail(request, question_id):
    '''
    try:
        question = Question.question.get(pk=question_id)
    except Question.DoesNotExist:
        raise Http404("Question does not exist")
    '''
    print("************"+str(question_id))
    question = get_object_or_404(Question, pk=question_id)
    print(type(question))
    return render(request, 'polls/detail.html', {'question':question})


def results(request, question_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)

def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk = request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        return render(request, 'polls/detail.html', {'question':question, 'error_message':"You didn't select a choice.",})
    else:
        selected_choice.votes = F('votes')+1  # 防止两个人同时投票出现数据冲突
        selected_choice.save()
        selected_choice = question.choice_set.get(pk = request.POST['choice'])

        return HttpResponseRedirect(reverse('polls:results', args=(question.id),))
    return HttpResponse("You're voting on question %s." % question_id)

#https://docs.djangoproject.com/en/2.0/intro/tutorial03/