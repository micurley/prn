---
layout: page
title: Most Recent Podcasts
tagline: from prn.fm
---
{% include JB/setup %}

<div class='row'>
{% for post in site.posts limit:3 %}
    {% assign year = page.date | date: '%m%Y' %}
    <div class="col-md-4 audio-container" style="padding-bottom: 25px;">
        <a href="{{ post.url | prepend: site.baseurl | replace: '//', '/' }}">
            <div class='audio-link'>
                go ->
            </div>
        </a>
        <div class='audio-date'>
            <date class="date-pub" title="{{ post.date | date_to_xmlschema }}" datetime="{{ post.date | date_to_xmlschema }}" pubdate>
            <span class="month"><abbr>{{ post.date | date: '%B' }}</abbr></span>
            <span class="day">{{ post.date | date: '%d' }}</span>
            <span class="year">{{ post.date | date: '%Y' }}</span>
            </date>
        </div>
        {% if post.image.url != '' %}
            <img class="img-responsive audio-image" src="{{ post.image.url }}" alt="podcast image" style='margin: auto;'>
        {% elsif post.show.image.url != '' %}
            <img class="img-responsive audio-image" src="{{ post.show.image.url }}" alt="show image" style='margin: auto;'>
        {% endif %}

        {% if post.podcast.url != '' %}
            <a href="{{ post.podcast.url }}" class="btn-download">
                <div class='audio-play' data-audio='{{ post.podcast.url }}'></div>
            </a>
            <div style='clear:both;'></div>
            {% if post.podcast.length != '' %}
                <div class='audio-duration'>{{ post.podcast.length }}</div>
            {% endif %}
        {% endif %}
    </div><!-- entry-content -->
{% endfor %}
</div>
<div class="date-tear-sheet-seperator" style='padding-bottom: 25px;'></div>
{% for post in site.posts offset 3 limit:20 %}
#### <small>[{{ post.category }}]({{ site.baseurl }}/categories/{{ post.category }})</small> :: [{{ post.title }}]({{ site.baseurl }}{{ post.url }}) &mdash; *{{ post.date | date_to_string }}*
{{ post.excerpt | markdownify }}
<hr noshade="" style="background-color: white;border: 0px;border-bottom: 1px dashed red;">
{% endfor %}
