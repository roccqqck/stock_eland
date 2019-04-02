#!/usr/bin/env python
# coding: utf-8

# In[6]:


import pandas as pd


# In[8]:


df_forum = pd.read_csv("bda2019_dataset/forum2.csv",encoding="utf-8")
df_forum.head()


# In[4]:


df_forum.to_json('bda2019_dataset/forum2.json', orient='records')


# In[9]:


df_forum = pd.read_json("bda2019_dataset/forum2.json",encoding="utf-8")
df_forum.head()


# In[ ]:




