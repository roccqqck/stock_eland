#!/usr/bin/env python
# coding: utf-8

# In[1]:


import jieba


# In[2]:


content = "1,2,3,我好好!\n你在幹嘛?\n哈哈哈.\n,4,5,6"
seg_list = jieba.cut(content, cut_all=False)
print(" ".join(seg_list))


# In[ ]:


content = open("bda2019_dataset/forum2.txt", "rb").read()
seg_list = jieba.cut(content, cut_all=False)
print(" ".join(seg_list),file=open("bda2019_dataset/forum3.txt", "a"))  # 精確模式
del content
del seg_list


# In[ ]:


content = open("bda2019_dataset/bbs2.txt", "rb").read()
seg_list = jieba.cut(content, cut_all=False)
print(" ".join(seg_list),file=open("bda2019_dataset/bbs3.txt", "a"))  # 精確模式
del content
del seg_list


# In[ ]:


content = open("bda2019_dataset/news2.txt", "rb").read()
seg_list = jieba.cut(content, cut_all=False)
print(" ".join(seg_list),file=open("bda2019_dataset/news3.txt", "a"))  # 精確模式
del content
del seg_list


# In[ ]:




