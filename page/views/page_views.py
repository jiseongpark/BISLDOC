from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404


def index(request):
    """
    메인 페이지 출력
    """
    context = {
        
    }

    return render(request, 'page/home.html', context)
