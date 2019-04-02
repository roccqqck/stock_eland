#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[2]:


df_bbs = pd.read_csv("bda2019_dataset/bbs2.csv",encoding="utf-8")
df_bbs.head(2)


# In[3]:


df_bbs.to_json('bda2019_dataset/bbs2.json', orient='records')


# In[4]:


df_bbs = pd.read_json("bda2019_dataset/bbs2.json",encoding="utf-8")
df_bbs.head(2)


# In[ ]:




