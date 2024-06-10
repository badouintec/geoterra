from django.shortcuts import render
from .models import ShapefileModel
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
from django.contrib.gis.geos import GEOSGeometry

def index(request):
    return render(request, 'index.html')

@csrf_exempt
def save_shapefile(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        shape = data.get('shape')
        geom = GEOSGeometry(json.dumps(shape['geometry']))
        name = shape['properties'].get('name', 'Unnamed')

        shapefile = ShapefileModel(name=name, geom=geom)
        shapefile.save()
        return JsonResponse({'status': 'success'})

    return JsonResponse({'status': 'failed'})

def get_shapefiles(request):
    shapefiles = ShapefileModel.objects.all()
    features = [{"type": "Feature", "geometry": json.loads(shapefile.geom.geojson), "properties": {"name": shapefile.name}} for shapefile in shapefiles]
    return JsonResponse({"type": "FeatureCollection", "features": features})
