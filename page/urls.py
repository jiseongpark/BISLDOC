from django.urls import path

from .views import page_views

app_name = 'page'

urlpatterns = [
    # page_views.py
    path('', page_views.index, name='index'),
]