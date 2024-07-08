import pandas as pd
import numpy as np
import warnings
import seaborn as sns
import matplotlib.pyplot as plt
import random
import nltk
from nltk.corpus import stopwords

warnings.filterwarnings('ignore')


class Profile:
    df = pd.read_csv(r'C:\Users\sonas\PycharmProjects\palliative_care\myapp\static\dataset.csv')  # static variable

    def __init__(self, diet, disease, Nutrient, food_type, favorite_food):
        self.diet = diet
        self.disease = disease
        self.nutrient = Nutrient
        self.type = food_type
        self.like = favorite_food
        self.df2 = pd.DataFrame(columns=list(Profile.df.columns))
        self.df3 = pd.DataFrame(columns=list(Profile.df.columns))
        self.df4 = pd.DataFrame(columns=list(Profile.df.columns))
        self.df5 = pd.DataFrame(columns=list(Profile.df.columns))
        self.df6 = pd.DataFrame(columns=list(Profile.df.columns))

    def removestop(self, tokens):
        stop = set(stopwords.words('english'))
        file = open(r'C:\Users\sonas\PycharmProjects\palliative_care\myapp\static\stopwords.txt', 'r')
        l = list(file.read().split())
        stop = list(stop) + l
        l = [token for token in tokens if token not in stop]
        return l

    def inputs(self, diet, disease, Nutrient, food_type, favorite_food):

        if Nutrient:
            self.df2 = Profile.df[Profile.df.Nutrient.isin(Nutrient)]
            self.df2 = self.df2.reset_index()

        if food_type:
            self.df2 = self.df2[self.df2.Veg_Non.isin(food_type)]
            self.df2 = self.df2.reset_index()

        if diet:
            for i in range(self.df2.shape[0]):
                l = str(self.df2.loc[i, 'Diet']).split()

                for d in diet:
                    if d in l:
                        self.df4 = self.df4._append(self.df2.loc[i])

        if disease:
            for i in range(self.df2.shape[0]):
                l = str(self.df2.loc[i, 'Disease']).split()
                for d in disease:
                    if d in l:
                        self.df5 = self.df5._append(self.df2.loc[i])

        if favorite_food:
            f = self.removestop(favorite_food.split())
            for i in range(Profile.df.shape[0]):
                n = [j.lower() for j in str(Profile.df.loc[i, 'Name']).split()]
                for j in n:
                    for k in f:
                        if k == j:
                            self.df6 = self.df6._append(Profile.df.loc[i])
            for i in range(Profile.df.shape[0]):
                n = [j.lower() for j in str(Profile.df.loc[i, 'description']).split()]
                for j in n:
                    for k in f:
                        if k == j:
                            self.df6 = self.df6._append(Profile.df.loc[i])
            for i in range(Profile.df.shape[0]):
                n = [j.lower() for j in str(Profile.df.loc[i, 'catagory']).split()]
                for j in n:
                    for k in f:
                        if k == j:
                            self.df6 = self.df6._append(Profile.df.loc[i])

        return self.df2, self.df3, self.df4, self.df5, self.df6

    def get_profile(self):
        df2, df3, df4, df5, df6 = self.inputs(self.diet, self.disease, self.nutrient, self.type, self.like)

        df_merge = pd.concat([df2, df3, df4, df5, df6], axis=0).drop_duplicates(subset='Name')
        df_merge = df_merge.filter(['Name', 'Nutrient', 'Veg_Non', 'Price', 'Review', 'description'])
        # print(df_merge.shape)

        return df_merge

# multiple inputs by radio button
# ob = Profile(['high_protien_diet','gluten_free_diet'],['diabeties','anemia'],
#              ['calcium','protien'],['non-veg','veg'],'i like burger and sandwich')
# ob = Profile(['high_protien_diet','gluten_free_diet'],['diabeties'],
#              ['calcium','protien'],['veg'],'i like chicken')
#
# profile = ob.get_profile()
# print(profile)