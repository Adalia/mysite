from django.db import models

class QuestionManager(models.Manager):
    def all(self):
        return super(QuestionManager, self).all()