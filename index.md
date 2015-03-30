---
layout: page
title: Most Recent Posts
tagline: Supporting tagline
---
{% include JB/setup %}

<div class='row'>
{% for post in page.posts limit:3 %}
    {% assign year = page.date | date: '%m%Y' %}
    <div class="col-md-4">
        <a href="{{ post.url | prepend: site.baseurl | replace: '//', '/' }}">
            {% if post.image.url != '' %}
                <img class="img-responsive" src="{{ post.image.url }}" alt="podcast image" style='margin: auto;'>
            {% elsif post.show.image.url != '' %}
                <img class="img-responsive" src="{{ post.show.image.url }}" alt="show image" style='margin: auto;'>
            {% endif %}

            <p class="date-publish" style='font-weight:bold;font-style:italic;margin-top:10px;'>
                <date class="date-pub" title="{{ post.date | date_to_xmlschema }}" datetime="{{ post.date | date_to_xmlschema }}" pubdate>
                <span class="month"><abbr>{{ post.date | date: '%B' }}</abbr></span>
                <span class="day">{{ post.date | date: '%d' }}</span>
                <span class="year">{{ post.date | date: '%Y' }}</span>
                </date>
                {% if post.podcast.length != '' %}
                    &mdash; Duration: {{ post.podcast.length }}
                {% endif %}
            </p>
            <div style='clear:both;'></div>
        </a>
        {% if post.podcast.url != '' %}
        <div style='width: 100%;border: 20px solid #FFF;margin-left: -20px;'>
            <audio id='podcast-audio' controls preload="none" style='width: 70%;margin: 0 15%;'>
                <source src="{{ post.podcast.url }}" type="{{ post.podcast.type }}">
                Your browser does not support the audio element.
            </audio>
            <div style='text-align:center;'>
                <a href="{{ post.podcast.url }}" class="btn-download">Right Click and 'Save As" to Download</a>
            </div>
        </div>
        {% endif %}
    </div><!-- entry-content -->
{% endfor %}
</div>

{% for post in site.posts offset 3 limit:20 %}
#### [{{ post.categories.0 }}]({{ site.baseurl }}{{ post.categories.0 }})/[{{ post.title }}]({{ site.baseurl }}{{ post.url }}) &mdash; *{{ post.date | date_to_string }}*
{{ post.excerpt | markdownify }}
<hr noshade="" style="background-color: white;border: 0px;border-bottom: 1px dashed red;">
{% endfor %}
