#!/usr/bin/env python
# coding: utf-8

# In[6]:


import pandas as pd


# In[7]:


df_OTC2018 = pd.read_csv("bda2019_dataset/OTC2018.csv",encoding="utf-8")
df_OTC2017 = pd.read_csv("bda2019_dataset/OTC2017.csv",encoding="utf-8")
df_OTC2016 = pd.read_csv("bda2019_dataset/OTC2016.csv",encoding="utf-8")
df_TWSE2018 = pd.read_csv("bda2019_dataset/TWSE2018.csv",encoding="utf-8")
df_TWSE2017 = pd.read_csv("bda2019_dataset/TWSE2017.csv",encoding="utf-8")
df_TWSE2016 = pd.read_csv("bda2019_dataset/TWSE2016.csv",encoding="utf-8")
df_bbs = pd.read_csv("bda2019_dataset/bbs2.csv",encoding="utf-8")
df_forum = pd.read_csv("bda2019_dataset/forum2.csv",encoding="utf-8")
df_news = pd.read_csv("bda2019_dataset/news2.csv",encoding="utf-8")


# In[8]:


df_OTC2018.head()


# In[22]:


df_OTC2017.head()


# In[23]:


df_OTC2016.head()


# In[24]:


df_TWSE2018.head()


# In[25]:


df_TWSE2017.head()


# In[26]:


df_TWSE2016.head()


# In[27]:


df_bbs.head()


# In[28]:


df_forum.head()


# In[29]:


df_news.head()


# In[ ]:




