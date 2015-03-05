---
layout: page
title: Most Recent Posts
tagline: Supporting tagline
---
{% include JB/setup %}
### {{ BASE_PATH }}/
{% for post in site.posts limit:20 %}
#### [{{ post.title }}]({{ post.url }}) &mdash; *{{ post.date | date_to_string }}*
{{ post.excerpt | markdownify }}
<hr noshade="" style="background-color: white;border: 0px;border-bottom: 1px dashed red;">
{% endfor %}
