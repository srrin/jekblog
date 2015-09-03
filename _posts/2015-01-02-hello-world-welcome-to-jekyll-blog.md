---
layout: post
title: "Hello world welcome to jekyll blog with comment"
description: "An awesome introduction to jekyll and its features."
author: "Ajinkya Borade"
coverImg: "post-bg.jpg"
comments: true
---


#Hello world welcome to jekyll blog Including comment

An awesome introduction to jekyll and its features. An awesome introduction to jekyll and its features.An awesome introduction to jekyll and its features.An awesome introduction to jekyll and its features.An awesome introduction to jekyll and its features.An awesome introduction to jekyll and its features. An awesome introduction to jekyll and its features.


###Hello world welcome to jekyll blog

#comment goes here

{% if page.comments %}
<div id="disqus_thread"></div>
<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES * * */
    // Required: on line below, replace text in quotes with your forum shortname
    var disqus_shortname = 'FORUM SHORTNAME GOES HERE';
    
    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>

<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES * * */
    // Required: on line below, replace text in quotes with your forum shortname
    var disqus_shortname = 'FORUM SHORTNAME GOES HERE';
    
    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function () {
        var s = document.createElement('script'); s.async = true;
        s.type = 'text/javascript';
        s.src = '//' + disqus_shortname + '.disqus.com/count.js';
        (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
    }());
</script>

{% endif %}