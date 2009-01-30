;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; definitions.tag                                               ;;;
;;; Author : Sebastien Varrette <Sebastien.Varrette@uni.lu>       ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#use wml::std::tags
#use wml::std::info
#use wml::des::navbar

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Multiple definitions for future insertion ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; --- Left Menu --- ;;;
<divert MENU>
    <navbar:render name=navbar>
</divert>

<define-tag htitle>
        {#PAGE_TITLE#:%0:##}
</define-tag>

<define-tag me whitespace=delete>
    <a href="http://varrette.gforge.uni.lu">Sebastien Varrette</a>
</define-tag>


;;; --- Last update --- ;;;
<define-tag maj>Last update: <get-var WML_SRC_ISOTIME /></define-tag>

;;; --- Gforge --- ;;;
<define-tag gfunilu whitespace=delete>
    <a href="http://gforge.uni.lu">Gforge @ uni.lu</a>
</define-tag>

<define-tag gforge_unilu whitespace=delete>
    <a href="http://gforge.uni.lu">gforge.uni.lu</a>
</define-tag>

<define-tag gforge_unilu_logo whitespace=delete>
    <a href="https://gforge.uni.lu">
      <img src="https://gforge.uni.lu/themes/osx/images/logo.png" 
	   alt="Gforge @ uni.lu" width="260" height="60" />
    </a>
</define-tag>

;;; --- university - laboratory - school --- ;;;
<define-tag unilu whitespace=delete>
    <a href="http://www.uni.lu">University of Luxembourg</a>
</define-tag>

;;; --- soft ---
<define-tag duplicity whitespace=delete>
    <a href="http://duplicity.nongnu.org/">Duplicity</a>
</define-tag>
<define-tag perl whitespace=delete>
    <a href="http://www.perl.org/">Perl</a>
</define-tag>
<define-tag cpan whitespace=delete>
    <a href="http://www.cpan.org/">CPAN</a>
</define-tag>
<define-tag backup whitespace=delete>
    <code>backup</code>
</define-tag>
<define-tag rsync whitespace=delete>
  <a href="http://samba.anu.edu.au/rsync/">rsync</a>
</define-tag>
<define-tag stow whitespace=delete>
  <a href="http://www.gnu.org/software/stow/">stow</a>
</define-tag>

 
;;; -- classical links --- ;;;
<define-tag link  whitespace=delete>
    <a href="%0">%0</a>
</define-tag>

<define-tag section  whitespace=delete>
    <a href="$(ROOTREL)/%0.html">%0</a>
</define-tag>

;;; -- Title in h2 with "top" link on the right
<define-tag title_top>
    <preserve title><set-var %attributes>
    <hspace><hr/>
    <table width="80%">
      <tr>
      <td><h2><get-var title></h2></td>
      <td align="right">(<a href="#top">top</a>)</td> 
    </tr>
    </table>
    <restore title>
 </define-tag>

;;; --- top ---
<define-tag top whitespace=delete>
   (<a href="#top">top</a>)
</define-tag>

;;; --- hspace ---
<define-tag hspace whitespace=delete>
   <p>&nbsp;</p>
</define-tag>
