from django.contrib import admin
from django.contrib.gis.admin import OSMGeoAdmin
from .models import ShapefileModel

@admin.register(ShapefileModel)
class ShapefileAdmin(OSMGeoAdmin):
    list_display = ('name', 'geom')
