!function(){tinymce.PluginManager.requireLangPack("uploadimage"),tinymce.create("tinymce.plugins.UploadImage",{UploadImage:function(e,t){function a(){document.getElementsByName("file")[0].value?i():e.windowManager.close}function n(){f&&f.close(),f=y.windowManager.open({title:e.translate("Insert an image from your computer"),width:500+parseInt(y.getLang("uploadimage.delta_width",0),10),height:180+parseInt(y.getLang("uploadimage.delta_height",0),10),body:[{type:"iframe",url:"javascript:void(0)",style:"display: none"},{type:"textbox",name:"file",label:e.translate("Choose an image"),subtype:"file",onchange:a},{type:"textbox",name:"alt",label:e.translate("Image description")},{type:"container",classes:"error",html:"<p style='color: #b94a48;'>&nbsp;</p>"},{type:"container",classes:"throbber"}],buttons:[{text:e.translate("Insert"),onclick:i,subtype:"primary"},{text:e.translate("Cancel"),onclick:e.windowManager.close}]},{plugin_url:t}),f.off("submit"),f.on("submit",i),p=f.find("iframe")[0],d=c("form",{action:e.getParam("uploadimage_form_url","/tinymce_assets"),target:p._id,method:"POST",enctype:"multipart/form-data",accept_charset:"UTF-8"}),p.getEl().name=p._id,d.appendChild(c("input",{type:"hidden",name:"utf8",value:"✓"})),d.appendChild(c("input",{type:"hidden",name:"authenticity_token",value:s("csrf-token")})),d.appendChild(c("input",{type:"hidden",name:"hint",value:e.getParam("uploadimage_hint","")}));for(var n=f.getEl(),o=document.getElementById(n.id+"-body"),r=o.getElementsByClassName("mce-container"),l=0;l<r.length;l++)d.appendChild(r[l]);for(var m=d.getElementsByTagName("input"),l=0;l<m.length;l++){var g=m[l];"input"==g.tagName.toLowerCase()&&"hidden"!=g.type&&("file"==g.type?(g.name="file",tinymce.DOM.setStyles(g,{border:0,boxShadow:"none",webkitBoxShadow:"none"})):g.name="alt")}o.appendChild(d),f.hide();var u=new MouseEvent("click",{view:window,bubbles:!0,cancelable:!1});u.toElement=document.getElementsByName("file")[0],document.getElementsByName("file")[0].dispatchEvent(u)}function i(){if(""==u("file"))return m("You must choose a file");h=new top.tinymce.ui.Throbber(f.getEl()),h.show(),l();var e=p.getEl();e.attachEvent?(e.detachEvent("onload",o),e.attachEvent("onload",o)):(e.removeEventListener("load",o),e.addEventListener("load",o,!1)),d.submit()}function o(){h&&h.hide();var e=p.getEl();if(e.document||e.contentDocument){var t=e.contentDocument||e.contentWindow.document;r(t.getElementsByTagName("body")[0].innerHTML)}else m("Didn't get a response from the server")}function r(t){try{var a=tinymce.util.JSON.parse(t);a.error?m(a.error.message):(e.execCommand("mceInsertContent",!1,g(a)),e.windowManager.close())}catch(n){m("Got a bad response from the server")}}function l(){var e=f.find(".error")[0].getEl();e&&(e.getElementsByTagName("p")[0].innerHTML="&nbsp;")}function m(t){var a=f.find(".error")[0].getEl();a&&(a.getElementsByTagName("p")[0].innerHTML=e.translate(t))}function c(e,t){var a=document.createElement(e);for(var n in t)t[n]instanceof Function||(a[n]=t[n]);return a}function g(t){var a=e.getParam("uploadimage_default_img_class",""),n=e.getParam("uploadimage_figure",!1),i=u("alt"),o="<img src='"+t.image.url+"'";if(""!=a&&(o+=" class='"+a+"'"),t.image.height&&(o+=" height='"+t.image.height+"'"),t.image.width&&(o+=" width='"+t.image.width+"'"),o+=" alt='"+i+"'/>",n){var r=e.getParam("uploadimage_figure_class","figure"),l=e.getParam("uploadimage_figcaption_class","figcaption"),m="<figure";return""!==r&&(m+=" class='"+r+"'"),m+=">"+o,m+="<figcaption",""!=l&&(m+=" class='"+l+"'"),m+=">"+i+"</figcaption>",m+="</figure>"}return o}function u(e){var t=d.getElementsByTagName("input");for(var a in t)if(t[a].name==e)return t[a].value;return""}function s(e){var t=document.getElementsByTagName("meta");for(var a in t)if(t[a].name==e)return t[a].content;return null}var d,p,f,h,y=e;y.addButton("uploadimage",{tooltip:e.translate("Insert an image from your computer"),icon:"image",onclick:n}),y.addMenuItem("uploadimage",{text:e.translate("Insert an image from your computer"),icon:"image",context:"insert",onclick:n})}}),tinymce.PluginManager.add("uploadimage",tinymce.plugins.UploadImage)}();