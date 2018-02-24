from django.shortcuts import render
from django.http import HttpResponse
import os

def index(request):
    print(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    return render(request, 'index.html')
#BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
