from django.shortcuts import render
from django.utils import timezone
from django.http import HttpResponse, Http404
from django.core.files.storage import FileSystemStorage
from django.conf import settings

from .api_ocr import ocr_api
import json
import os

from django.db.models import Q, Count


def index(request):
    """
    처방전 업로드 사이트 홈

    이 사이트에서 버튼을 누르면 upload하는 사이트로 이동
    """

    return render(request, 'prescription/pre_home.html')


# Create your views here.

def presc_upload(request):
    content = {"exist": False}
    
    if request.method == 'POST' and request.FILES['myfile']:
        myfile = request.FILES['myfile']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        uploaded_file_url = fs.url(filename)
        res_dict = ocr_api('./prescDir/' + filename)

        # res_dict = json.load(res_dict_str)
        # print(uploaded_file_url)
        res_dict['uploaded_file_url'] = uploaded_file_url

        print(res_dict['images'][0])
        with open('./prescDir/' + 'presc.json', 'w') as fp:
            json.dump(res_dict, fp, indent=4)

        descr = [
            '적절한 체중감량요법(식이요법 및/또는 운동요법)에 반응하지 않는 초기 체질량 지수(Body Mass Index : BMI)가 30 kg/m2 이상, 또는 다른 위험인자(예, 고혈압, 당뇨, 고지혈증)가 있는 BMI 27 kg/m2 이상인 외인성 비만 환자에서 운동, 행동 수정 및 칼로리 제한을 기본으로 하는 체중감량요법의 단기간 보조요법. 이 약은 다른 식욕억제제와 병용하지 않고 단독으로만 사용해야 한다.아래는 다양한 키와 체중에 근거한 체질량지수표이다. 체질량지수는 환자의 체중(kg)을 환자의 키(m)의 제곱으로 나누어 계산된다.',
            '감기의 제증상 (인후통,기침,가래,오한,발열,두통,관절통,근육통) 의 완화. 성인 1회 1정, 1일 3회 식후 30분에 복용한다.',
            '음식물 섭취 감소를 통한 체중감량의 보조요법. 1일 3회 2정씩 식전에 복용하고 필요에 따라서는 취침전에 추가로 2정 복용가능하다. 충분한 양의 물과 함께 복용하는 것이 좋다. 권장량을 최소 3-4주간 복용할 것이 권장된다.',
            '체질량지수(BMI) 30 kg/m² 이상 또는 다른 위험인자(예, 고혈압, 당뇨, 이상지질혈증)가 있는 27 kg/m² 이상의 비만환자에 있어 저칼로리 식이와 함께 체중감소 또는 체중유지를 포함한 비만치료 또는 체중 재증가의 위험이 감소한다.'
        ]

        idx = 0
        for i in range(len(res_dict['images'][0]['fields'])):
            if res_dict['images'][0]['fields'][i]['inferText'] == "":
                idx = i
                break
            res_dict['images'][0]['fields'][i]['description'] = descr[i]

        res_dict['images'][0]['fields'] = res_dict['images'][0]['fields'][:idx]

        content = res_dict['images'][0]
        content['exist'] = True

        return render(request, 'prescription/presc_upload.html', content)

    return render(request, 'prescription/presc_upload.html', content)