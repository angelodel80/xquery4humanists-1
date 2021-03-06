---
layout: page
title: Pp. 148 (no. 169)
permalink: /code/169-pp148/
---

This code sample is adapted from Clifford B. Anderson and Joseph C. Wicentowski, 
[_XQuery for Humanists_](/) (College Station: Texas A&M University Press, 2020), 148. 
Download this code sample in its [raw form](/code/169-pp148/169-pp148.xq).
View the source on [GitHub](https://github.com/coding4humanists/xquery4humanists/blob/release/code/169-pp148/169-pp148.xq).

```xquery
xquery version "3.1";

declare variable $eastern-countries := ["China", "Russia", "Japan"];
declare variable $western-countries := ["Mexico", "Canada", "United States"];
declare variable $countries := 
    map {
        "eastern-countries": $eastern-countries,
        "western-countries": $western-countries
    };

$countries?*
```  
