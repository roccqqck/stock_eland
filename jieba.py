#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import jieba


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




