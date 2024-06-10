from django.contrib.gis.db import models

class ShapefileModel(models.Model):
    id = models.BigAutoField(primary_key=True)  # Definir una clave primaria
    name = models.CharField(max_length=100)
    geom = models.GeometryField()

    def __str__(self):
        return self.name
