#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[2]:


df_OTC2018 = pd.read_csv("bda2019_dataset/OTC2018.csv",encoding="utf-8")
df_OTC2017 = pd.read_csv("bda2019_dataset/OTC2017.csv",encoding="utf-8")
df_OTC2016 = pd.read_csv("bda2019_dataset/OTC2016.csv",encoding="utf-8")
df_TWSE2018 = pd.read_csv("bda2019_dataset/TWSE2018.csv",encoding="utf-8")
df_TWSE2017 = pd.read_csv("bda2019_dataset/TWSE2017.csv",encoding="utf-8")
df_TWSE2016 = pd.read_csv("bda2019_dataset/TWSE2016.csv",encoding="utf-8")
df_bbs = pd.read_csv("bda2019_dataset/bbs2.csv",encoding="utf-8")
df_forum = pd.read_csv("bda2019_dataset/forum2.csv",encoding="utf-8")
df_news = pd.read_csv("bda2019_dataset/news2.csv",encoding="utf-8")


# In[3]:


df_OTC2018.head(2)


# In[ ]:


df_OTC2017.head(2)


# In[ ]:


df_OTC2016.head(2)


# In[4]:


df_TWSE2018.head(2)


# In[ ]:


df_TWSE2017.head(2)


# In[ ]:


df_TWSE2016.head(2)


# In[5]:


df_bbs.head(2)


# In[6]:


df_forum.head(2)


# In[7]:


df_news.head(2)


# In[ ]:




