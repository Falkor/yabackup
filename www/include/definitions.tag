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

;;; -- classical links --- ;;;
<define-tag link  whitespace=delete>
    <a href="%0">%0</a>
</define-tag>

<define-tag section  whitespace=delete>
    <a href="$(ROOTREL)/%0.html">%0</a>
</define-tag>

;;; --- top ---
<define-tag top whitespace=delete>
   (<a href="#top">top</a>)
</define-tag>
<define-tag topr whitespace=delete>
   <div class="right"><top></div>
</define-tag>

<define-tag title_top whitespace=delete>
  <hspace>;;;<hr/>
  <div class="right"><small><top></small></div><h2>%0</h2><br/>
</define-tag>
<define-tag title_notop whitespace=delete>
    <hspace><hr/>
    <h2>%0</h2><br/>
 </define-tag>

;;; --- Last update --- ;;;
<define-tag maj>Last update: <get-var WML_SRC_ISOTIME /></define-tag>

;;; --- hspace and tabulation ---
<define-tag hspace whitespace=delete>
   <p>&nbsp;</p>
</define-tag>
<define-tag tab whitespace=delete>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</define-tag>

;;; --- Website admin ---
<define-tag admin whitespace=delete>
    <a href="mailto:Sebastian.Varrette 'at' uni.lu">admin</a>
</define-tag>

;;; --- Links --- ;;;
<define-tag project whitespace=delete>
    <a href="http://$(PROJECT_UNIXNAME).gforge.uni.lu">$(PROJECT_NAME)</a>
</define-tag>

;;; --- Gforge --- ;;;
<define-tag gforge_unilu whitespace=delete>
    <a href="http://gforge.uni.lu">GForge @ Uni.lu</a>
</define-tag>
<define-tag gforge_unilu_logo whitespace=delete>
    <a href="https://gforge.uni.lu">
      <img src="https://gforge.uni.lu/themes/osx/images/logo.png" 
	   alt="Gforge @ uni.lu" width="260" height="60" />
    </a>
</define-tag>

;;; --- Universities and Research Centers --- ;;;
<define-tag short_ul whitespace=delete>
    <a href="http://www.uni.lu">UL</a>
</define-tag>
<define-tag unilu whitespace=delete>
    <a href="http://www.uni.lu">University of Luxembourg</a>
</define-tag>
<define-tag unilu_logo whitespace=delete>
    <a href="http://www.uni.lu">
      <img src="http://www.uni.lu/design/plain/override/images/logo_uni.lu.jpg"
	   alt="University of Luxembourg" />
    </a>
</define-tag>
<define-tag csc whitespace=delete>
    <a href="http://csc.uni.lu">Computer Science and Communications (CSC)</a>
</define-tag>
<define-tag short_csc whitespace=delete>
    <a href="http://csc.uni.lu">CSC</a>
</define-tag>
<define-tag csc_logo whitespace=delete>
    <a href="http://csc.uni.lu">
      <img src="$(ROOTREL)/images/logo_CSC.png"
	   alt="Computer Science and Communications (CSC) research Unit" />
    </a>
</define-tag>
<define-tag csc_logo_right whitespace=delete>
    <a href="http://csc.uni.lu">
      <img src="$(ROOTREL)/images/logo_CSC.png"
	   alt="Computer Science and Communications (CSC) research Unit" style="float:right;"/>
    </a>
</define-tag>
<define-tag unilu_logo_left whitespace=delete>
    <a href="http://www.uni.lu">
      <img src="http://www.uni.lu/design/plain/override/images/logo_uni.lu.jpg"
	   alt="University of Luxembourg" style="float:left;"/>
    </a>
</define-tag>
<define-tag unilu_logo_right whitespace=delete>
      <a href="http://www.uni.lu">
	<img src="http://www.uni.lu/design/plain/override/images/logo_uni.lu.jpg"
	     alt="University of Luxembourg" style="float:right;"/>
      </a>
</define-tag>
<define-tag fstc whitespace=delete>
    <a href="http://fstc.uni.lu/">Faculty of Science, Technology and Communication</a>
</define-tag>
<define-tag fdef whitespace=delete>
    <a href="http://fdef.uni.lu/">Faculty of Law, Economics and Finance</a>
</define-tag>
<define-tag lsf whitespace=delete>
    <a href="http://lsf.uni.lu/">Luxembourg School of Finance (LSF)</a>
</define-tag>
<define-tag crp_tudor whitespace=delete>
    <a href="http://www.crpht.lu/">CRP Henri Tudor</a>
</define-tag>
<define-tag idimag whitespace=delete>
    <a href="http://www-id.imag.fr">ID-IMAG</a>
</define-tag>
<define-tag lig whitespace=delete>
    <a href="http://lig.imag.fr">LIG</a>
</define-tag>
<define-tag inpg whitespace=delete>
    <a href="http://www.grenoble-inp.fr/">INPG</a>
</define-tag>
<define-tag north_dakota_uni whitespace=delete>
    <a href="http://www.ndsu.nodak.edu/">North Dakota State University</a>
</define-tag>
<define-tag mines_st_etienne whitespace=delete>
    <a href="http://www.emse.fr/">Ecole des Mines de Saint-Etienne</a>
</define-tag>

;;; --- Other links --- ;;;
<define-tag g5k whitespace=delete>
    <a href="https://www.grid5000.fr">Grid'5000</a>
</define-tag>
<define-tag top500 whitespace=delete>
    <a href="http://top500.org">Top500</a>
</define-tag>
<define-tag fnr whitespace=delete>
    <a href="http://www.fnr.lu">FNR</a>
</define-tag>
<define-tag restena whitespace=delete>
    <a href="http://www.restena.lu">Restena</a>
</define-tag>
<define-tag siren whitespace=delete>
    <a href="http://sirene.eugrid.eu/">Siren</a>
</define-tag>

;;; --- soft ---
<define-tag wml whitespace=delete>
    <a href="http://thewml.org/">WML</a>
</define-tag>
<define-tag wml_logo whitespace=delete>
  <a href="http://www.thewml.org">    
    <img src="$(ROOTREL)/images/logo-wml.png" alt="WML rulez!"/>
  </a>
</define-tag>
<define-tag boost whitespace=delete>
    <a href="http://www.boost.org/">Boost C++ Librairies</a>
</define-tag>
<define-tag duplicity whitespace=delete>
    <a href="http://duplicity.nongnu.org/">Duplicity</a>
</define-tag>
<define-tag refperl whitespace=delete>
    <a href="http://www.perl.org/">Perl</a>
</define-tag>
<define-tag cpan whitespace=delete>
    <a href="http://www.cpan.org/">CPAN</a>
</define-tag>
<define-tag rsync whitespace=delete>
  <a href="http://samba.anu.edu.au/rsync/">rsync</a>
</define-tag>
<define-tag stow whitespace=delete>
  <a href="http://www.gnu.org/software/stow/">stow</a>
</define-tag>
<define-tag crontab whitespace=delete>
  <a href="http://www.linuxweblog.com/crotab-tutorial">crontab</a>
</define-tag>
<define-tag gnupg whitespace=delete>
    <a href="http://www.gnupg.org">GnuPG</a>
</define-tag>
<define-tag gnupg_logo whitespace=delete>
    <a href="http://www.gnupg.org">
      <img src="$(ROOTREL)/images/gnupg.png" style="text-align: left;"/>
    </a>
</define-tag>
<define-tag openpgp whitespace=delete>
  <a href="http://www.openpgp.org/">OpenPGP</a>
</define-tag>
<define-tag latex whitespace=delete>
  <a href="http://www.latex-project.org/">LaTeX</a>
</define-tag>
<define-tag bibtex whitespace=delete>
    <a href="http://www.bibtex.org/">BibTeX</a>
</define-tag>
<define-tag doxygen whitespace=delete>
    <a href="http://www.doxygen.org/">Doxygen</a>
</define-tag>
<define-tag setihome whitespace=delete>
  <a href="http://setiathome.berkeley.edu/">SETI@Home</a>
</define-tag>
<define-tag boinc whitespace=delete>
  <a href="http://boinc.berkeley.edu/">BOINC</a>
</define-tag>
<define-tag boincstats whitespace=delete>
  <a href="http://boincstats.org/">BOINC Stats</a>
</define-tag>
<define-tag globus whitespace=delete>
  <a href="http://www.globusorg/">Globus</a>
</define-tag>

;;; --- people --- ;;;
<define-tag svarrette whitespace=delete>
   <a href="mailto:Sebastien.Varrette 'at' uni.lu">Sebastien Varrette</a>
</define-tag>
<define-tag svarrette_home whitespace=delete>
   <a href="http://varrette.gforge.uni.lu">Sebastien Varrette</a>
</define-tag>
<define-tag gdanoy whitespace=delete>
   <a href="mailto:Gregoire.Danoy 'at' uni.lu">Gregoire Danoy</a>
</define-tag>
<define-tag gdanoy_home whitespace=delete>
   <a href="http://csc.uni.lu/members/gregoire_danoy">Gregoire Danoy</a>
</define-tag>
<define-tag bdorronsoro_home whitespace=delete>
   <a href="http://neo.lcc.uma.es/staff/bernabe/index_en.html">Bernabe Dorronsoro</a>
</define-tag>
<define-tag fpinel whitespace=delete>
   <a href="mailto:Frederic.Pinal 'at' uni.lu">Frederic Pinel</a>
</define-tag>
<define-tag pbouvry whitespace=delete>
   <a href="mailto:Pascal.Bouvry 'at' uni.lu">Pascal Bouvry</a>
</define-tag>
<define-tag pbouvry_home whitespace=delete>
   <a href="http://csc.uni.lu/members/pascal_bouvry">Pascal Bouvry</a>
</define-tag>
<define-tag marek whitespace=delete>
   <a href="mailto:Marek.Ostaszewski 'at' uni.lu">Marek Ostaszewski</a>
</define-tag>
<define-tag marek_home whitespace=delete>
   <a href="http://wwwen.uni.lu/recherche/fstc/computer_science_and_communications_research_unit/members/marek_ostaszewski">Marek Ostaszewski</a>
</define-tag>
<define-tag jlroch_home whitespace=delete>
   <a href="http://www-id.imag.fr/~jlroch/">Jean-Louis Roch</a>
</define-tag>
<define-tag dkhadraoui whitespace=delete>
   <a href="mailto:Djamel.Khadraoui 'at' tudor.lu">Djamel Khadraoui</a>
</define-tag>
<define-tag samee whitespace=delete>
   <a href="mailto:samee.khan@ndsu.edu">Samee U. Kahn</a>
</define-tag>
<define-tag samee_home whitespace=delete>
   <a href="http://www.ece.ndsu.nodak.edu/~khan/">Samee U. Kahn</a>
</define-tag>
<define-tag leprevost whitespace=delete>
   <a href="mailto:Franck.Leprevost@uni.lu">Franck Leprevost</a>
</define-tag>
<define-tag leprevost_home whitespace=delete>
   <a href="http://lacs.uni.lu/members/franck_leprevost">
     Franck Leprevost
   </a>
</define-tag>
<define-tag lhogie_home whitespace=delete>
   <a href="http://luc.hogie.fr/">Luc Hogie</a>
</define-tag>
<define-tag fguinand_home whitespace=delete>
   <a href="http://www-lih.univ-lehavre.fr/~guinand/">Frederic Guinand</a>
</define-tag>
<define-tag ealba_home whitespace=delete>
   <a href="http://www.lcc.uma.es/~eat/">Enrique Alba</a>
</define-tag>
<define-tag talbi_home whitespace=delete>
  <a href="http://www2.lifl.fr/~talbi/">El-Ghazali Talbi</a>
</define-tag>
<define-tag bpeters_home whitespace=delete>
  <a href="http://wwwen.uni.lu/recherche/fstc/research_unit_in_engineering_science_rues/membres/bernhard_peters">Bernhard Peters</a>
</define-tag>
<define-tag jsachau_home whitespace=delete>
  <a href="http://wiki.uni.lu/sce/Prof.+Juergen+Sachau.html">Juergen Sachau</a>
</define-tag>
<define-tag abiryukov_home whitespace=delete>
  <a href="http://homes.esat.kuleuven.be/~abiryuko/">Alex Biryukov</a>
</define-tag>
