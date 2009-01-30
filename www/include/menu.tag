;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; menu.tag                                                      ;;;
;;; Author : Sebastien Varrette <Sebastien.Varrette@uni.lu>       ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#use wml::std::tags
#use wml::std::info
#use wml::des::navbar

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Definition of the menu ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
<navbar:define name=navbar>
  <navbar:header></navbar:header>
  <navbar:footer></navbar:footer>
  <navbar:prolog><p></navbar:prolog>
  <navbar:epilog></p></navbar:epilog>
  
  <navbar:button id=home      txt="Home"           url="$(ROOTREL)/index.html">
  <navbar:button id=features  txt="Features"       url="$(ROOTREL)/features.html">
  <navbar:button id=docs      txt="Documentations" url="$(ROOTREL)/docs.html">
  <navbar:button id=download  txt="Download"    url="$(ROOTREL)/download.html">
;;;  <navbar:button id=download  txt="Download"       url="https://gforge.uni.lu/frs/?group_id=44">
  <navbar:button id=bugs      txt="Submit bugs"    url="https://gforge.uni.lu/tracker/?atid=249&group_id=44&func=browse">
  <navbar:button id=gforge    txt="Gforge"         url="https://gforge.uni.lu/projects/ibackup/">
  <navbar:button id=links     txt="Links"          url="$(ROOTREL)/links.html">
</navbar:define>


;;; --- shortcut for the sections in the menu ---
<define-tag menu_features whitespace=delete> <a href="$(ROOTREL)/features.html">Features</a>   </define-tag>
<define-tag menu_docs     whitespace=delete> <a href="$(ROOTREL)/docs.html">Documentations</a> </define-tag>
<define-tag menu_download whitespace=delete> <a href="$(ROOTREL)/download.html">Download</a>   </define-tag>
<define-tag menu_docs     whitespace=delete> <a href="$(ROOTREL)/links.html">Links</a>         </define-tag>
<define-tag menu_bugs     whitespace=delete> 
  <a href="https://gforge.uni.lu/tracker/?group_id=44">Submit Bugs</a>
</define-tag>








