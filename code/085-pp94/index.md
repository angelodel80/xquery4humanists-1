---
layout: page
title: Pp. 94 (no. 85)
permalink: /code/085-pp94/
---

This code sample is adapted from Clifford B. Anderson and Joseph C. Wicentowski, 
[_XQuery for Humanists_](/) (College Station: Texas A&M University Press, 2020), 94. 
Download this code sample in its [raw form](/code/085-pp94/085-pp94.xq).
View the source on [GitHub](https://github.com/coding4humanists/xquery4humanists/blob/release/code/085-pp94/085-pp94.xq).

```xquery
xquery version "3.1";

let $title := <title>se questo è un uomo</title>
let $titolo := <title>se questo è un uomo</title>
let $titel := $title
return
    $title is $titel
```  
