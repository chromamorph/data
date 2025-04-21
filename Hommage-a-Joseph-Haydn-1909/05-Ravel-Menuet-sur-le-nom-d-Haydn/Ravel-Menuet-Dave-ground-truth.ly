\version "2.22.2"


colorSoucyHaydn = {
	\override NoteHead.color = #(x11-color 'red)
	\override Stem.color = #(x11-color 'red)
	%\override Beam.color = #(x11-color 'red)
	\override Accidental.color = #(x11-color 'red)
	\override Tie.color = #(x11-color 'red)
	\override Glissando.color = #(x11-color 'red)
	\override Glissando.style = #'dashed-line
	\override Glissando.thickness = 3
}


colorDavePartial = {
	\override NoteHead.color = #(x11-color 'orange)
	\override Stem.color = #(x11-color 'orange)
	%\override Beam.color = #(x11-color 'orange)
	\override Accidental.color = #(x11-color 'orange)
	\override Tie.color = #(x11-color 'orange)
	\override Glissando.color = #(x11-color 'orange)
	\override Glissando.style = #'dashed-line
	\override Glissando.thickness = 3
}

colorDavePartialInv = {
	\override NoteHead.color = #(x11-color 'darkmagenta)
	\override Stem.color = #(x11-color 'darkmagenta)
	%\override Beam.color = #(x11-color 'darkmagenta)
	\override Accidental.color = #(x11-color 'darkmagenta)
	\override Tie.color = #(x11-color 'darkmagenta)
	\override Glissando.color = #(x11-color 'darkmagenta)
	\override Glissando.style = #'dashed-line
	\override Glissando.thickness = 3
}

colorSoucyHaydnRetroInv = {
	\override NoteHead.color = #(x11-color 'darkgreen)
	\override Stem.color = #(x11-color 'darkgreen)
	%\override Beam.color = #(x11-color 'darkgreen)
	\override Accidental.color = #(x11-color 'darkgreen)
	\override Tie.color = #(x11-color 'darkgreen)
	\override Glissando.color = #(x11-color 'darkgreen)
	\override Glissando.style = #'dashed-line
	\override Glissando.thickness = 3
}

colorSoucyHaydnRetro = {
	\override NoteHead.color = #(x11-color 'DarkRed)
	\override Stem.color = #(x11-color 'DarkRed)
	%\override Beam.color = #(x11-color 'DarkRed)
	\override Accidental.color = #(x11-color 'DarkRed)
	\override Tie.color = #(x11-color 'DarkRed)
	\override Glissando.color = #(x11-color 'DarkRed)
	\override Glissando.style = #'dashed-line
	\override Glissando.thickness = 3
}

colorSoucyOneOverAlpha = {
	\override NoteHead.color = #(x11-color 'BlueViolet)
	\override Stem.color = #(x11-color 'BlueViolet)
	%\override Beam.color = #(x11-color 'BlueViolet)
	\override Accidental.color = #(x11-color 'BlueViolet)
	\override Tie.color = #(x11-color 'BlueViolet)
	\override Glissando.color = #(x11-color 'BlueViolet)
	\override Glissando.style = #'dashed-line
	\override Glissando.thickness = 3
}

colorSoucyAlpha = {
	\override NoteHead.color = #(x11-color 'blue)
	\override Stem.color = #(x11-color 'blue)
	%\override Beam.color = #(x11-color 'blue)
	\override Accidental.color = #(x11-color 'blue)
	%\override Tie.color = #(x11-color 'blue)
	\override Glissando.color = #(x11-color 'blue)
	\override Glissando.style = #'dashed-line
	\override Glissando.thickness = 3
}


colorRevert = {
	  \revert Beam.color
	  \revert NoteHead.color
	  \revert Stem.color
	  \revert Accidental.color
	  \revert Tie.color
	  \revert Glissando.color
	  \revert Glissando.style
      \revert Glissando.thickness
}

#(set-global-staff-size 15)
barOneToThirtySevenUpper =  {
  <<
  	\new Voice {
  	  \voiceOne
  	  \relative {
	  \partial 4 
	  
	  \colorSoucyHaydn

	  b'4^\markup \with-color "red" \box "1"~ 
	  4\glissando a\glissando d\glissando
	  %bar 2
	  d\glissando g 

	  \colorRevert
	  
	  <d b>~
	  4 <a c>8 <g b> 
	  
	  %\colorSoucyAlpha
	  <e g>%^\markup \with-color "blue" \box "2"
	  %\colorRevert
	  
	  <fis a>
	  
	  %bar 4
	  <fis a>4 <g b> d'8 e
	  
	  %bar 5
	  \grace {d32 e} 
	  
	  %\colorSoucyAlpha
	  <d fis cis'>4%^\markup \with-color "blue" \box "3"
	  %\colorRevert
	  <cis e b'> d8 e

	  %bar 6
	  \grace {d32 e} 
	  
	  %\colorSoucyAlpha
	  <d fis cis'>4%^\markup \with-color "blue" \box "4"
	  %\colorRevert
	  
	  <cis e b'> d8 e
	  
	  %bar 7
	  \grace {d32 e} <d fis g,>4 
	  
	  %\colorSoucyOneOverAlpha 
	  e8%^\markup \with-color "BlueViolet" \box "5" 
	  %\colorRevert
	  
	  fis d cis
	  cis4 d 
	  
	  \colorSoucyHaydn
	  b~^\markup \with-color "red" \box "6"
	  4\glissando a\glissando d\glissando
	  
	  %bar 10
	  d\glissando g 
	  \colorRevert
	  
	  <d b>~
	  %bar 11
	  4 <a c>8 <g b> 
	  
	  %\colorSoucyAlpha
	  <e g>%^\markup \with-color "blue" \box "7" 
	  %\colorRevert
	  
	  <fis a>

	  %bar 12
	  <fis a>4 <g b> d'8 e
	  
	  %bar 13
	  \grace {d32 e} 
	  %\colorSoucyAlpha
	  <d fis cis'>4%^\markup \with-color "blue" \box "8"
	  %\colorRevert
	  
	  <cis e b'>
	  d8 e
	  
	  %bar 14
	  \grace {d32 e} 
	  %\colorSoucyAlpha
	  <d fis cis'>4%^\markup \with-color "blue" \box "9"
	  %\colorRevert
	  <cis e b'> d8 e
	  
	  %bar 15
	  \grace {d32 e} <d fis g,>4 
	  
	  %\colorSoucyOneOverAlpha
	  e8%^\markup \with-color "BlueViolet" \box "10"
	  %\colorRevert
	  
	  fis d cis
	  
	  %bar 16
	  cis4 d c,!8 d 
	  \grace {c32 d} e2 fis8 g

	  %bar 18
	  \grace {fis32 g} <fis a>2 <g b>8 <a cis>
	  \grace {b32 cis} d4. e8 cis b
	  d4. e8 cis b
	  d4. e8 cis b
	  a b fis2
	  a8 b fis2
	  
	  %bar 24
	  a8 b fis4 g8 a
	  \grace{g32 a} <g b>2 cis8 d
	  \grace{cis32 d} e2 fis8 g
	  \grace{fis32 g} gis4. ais8 eis dis
	  gis4. ais8 eis dis
	  
	  %\colorSoucyOneOverAlpha
	  <b d! g!>4.%^\markup \with-color "BlueViolet" \box "17"
	  %\colorRevert
	  a'!8 fis e

	  %bar 30
	  <g, b d g>4. a'8 fis e
	  cis4. <dis ais>8 eis, dis
	  <gis cis>4. <ais dis>8 eis dis

	  %bar 33
	  g!4. a!8 fis e~
	  
	  %bar 34
	  \stemDown 
	  <ais, e'>2.
	  
	  %bar 35
	  \stemUp
	  g'4. a!8 fis e~
	  
	  %bar 36
	  \stemDown
	  %\colorSoucyOneOverAlpha
	  4%^\markup \with-color "BlueViolet" \box "21" 
	  %\colorRevert
	  
	  c ais
	  \stemUp
	  
	  %bar 37
	  d!8 c g a! d, c
	  \clef treble
	  
	  %bar 38
	  b''4\rest b4\rest <d! fis a! d!>~
	  
	  %bar 39
	  4 <c e g c> <g b e! g>~
	  
	  %bar 40
	  4 <fis a dis fis> <c'! e gis c!>~
	  
	  %bar 41
	  4 <b dis eis b'> <e,! b' e!>~

	  %bar 42
	  4 <d d'> 
	  \colorSoucyHaydn
	  b''~^\markup \with-color "red" \box "22"

	  %bar 43
	  4\glissando a\glissando
	  
	  d,!\glissando
	  
	  %bar 44
	  %\once \override NoteHead.color = #(x11-color 'blue) 
	  d4\glissando%^\markup \with-color "blue" \box "23" 
	  g 
	  \colorRevert
	  
	  %bar 45
	  <d b>~ 4
	  <a c>8 <g b> 
	  
	  %\colorSoucyAlpha
	  <e g>%^\markup \with-color "blue" \box "25" 
	  %\colorRevert
	  
	  <fis a>
	  <fis a>4 <g b> f'!8 g
	  \grace{f!32 g} <e a e'>4 <d g d'>
	  f!8 g
	  \grace{f!32 g} <e a e'>4 <d g d'>
	  c'4
	  
	  %bar 49
	  \grace{c,32 d} 
	  %\colorSoucyAlpha
	  e2%^\markup \with-color "blue" \box "26" 
	  s4
	  e2%^\markup \with-color "blue" \box "27" 
	  s4
	  %\colorRevert
	  c! bes8 c ees,4
	  <c e!>2 <d fis>4
	  fis2 g4~2 b4\rest
	  }
  	}
  	\new Voice {
  	  \voiceTwo
  	  \relative {
  	  r4 
  	  %bar 1
  	  <c' e g> <d fis> r
  	  <g b>2 r4
  	  e2 s4
  	  b2 r4
  	  
  	  %bar 5
  	  %\colorSoucyAlpha
  	  <d fis cis'>4 
  	  %\colorRevert
  	  
  	  <cis e b'> s
  	  
  	  %\colorSoucyAlpha
  	  <d fis cis'>4 
  	  %\colorRevert
  	  
  	  <cis e b'> s
	  
	  %bar 7
	  s 
	  %\colorSoucyOneOverAlpha
	  <e g b>2
	  %\colorRevert
	  
	  %bar 8
	  <d fis a> 
	  <c! e g>4~
	  
	  %bar 9
	  4 <d fis> r
	  
	  %bar 10
  	  <g b>2 r4
  	  
  	  %bar 11
  	  e2 s4
  	  
  	  %bar 12
  	  b2 r4
  	  
  	  %bar 13
  	  
  	  %\colorSoucyAlpha
  	  <d fis cis'>4 
  	  %\colorRevert
  	  
  	  <cis e b'> s
  	  
  	  %bar 14
  	  
  	  %\colorSoucyAlpha
  	  <d fis cis'>4 
  	  %\colorRevert
  	  <cis e b'> s
  	  
  	  %bar 15
	  s 
	  %\colorSoucyOneOverAlpha
	  <e g b>2
	  %\colorRevert
	  <d fis a> s4
	  c2. 
	  b2.
	  <fis' b>2 <e a>4

	  %bar 20
	  <fis b>2 <fis a>4
	  <fis~ b>2 fis4
	  cis <d> <a cis>
	  <cis e> <b dis> <a cis>
	  <cis e>2 dis4
	  s2.
	  d'2.

	  %bar 27
	  s2 s8 
	  \once \omit Stem 
	  \once \omit Flag 
	  dis8~ 2.
	  
	  %bar 29
	  \colorSoucyHaydnRetro
	  g,!4\glissando_\markup \with-color "DarkRed" \box "18" d\glissando d\glissando
	  a\glissando b2
	  \colorRevert
	  
	  %bar 31
	  s2.
	  s2.
	  
	  %bar 33
	  <ais e'>2.
	  
	  %bar 34
	  \stemUp
	  g'!4. a!8 fis e~
	  
	  %bar 35
	  \stemDown
	  <ais, e'>2.
	  
	  %bar 36
	  \stemUp
	  %\colorSoucyOneOverAlpha
	  g'8 
	  %\colorRevert
	  
	  a! fis e
	  \clef bass
	  dis e
	  
	  %bar 37
	  \stemDown
	  g,4 e e

	  %bar 38
	  s4 s ais
	  b c! cis
	  
	  %bar 40
	  d dis dis!
	  e eis g!
	  gis a <b fis'~>
	  <bis fis'> <cis g'>
	  <fis, c'!>
	  
	  %bar 44
	  %\once \override NoteHead.color = #(x11-color 'blue) 
	  <a b>4~ <g b> fis
	  
	  %bar 45
	  e2 
	  
	  %\colorSoucyAlpha
	  c4 
	  %\colorRevert
	  
	  %bar46
	  b2 r4
	  
	  %bar 47
	  <b f'! a>4 <d g b> r
	  %bar 48
	  <b f'! a>4 <d g b> c'8 d
	  %bar 49
	  %\colorSoucyAlpha
	  <gis, c>4 
	  %\colorRevert
	  
	  <fis b>8 c' <c, e> g'!
	  
	  %bar 50
	  %\colorSoucyAlpha
	  <gis c>4 
	  %\colorRevert
	  <fis b>8 c' <c, e> g'!
	  <des f>2 c4 
	  s s
	  s
	  <b d>2.~ 2
  	  }
  	}
% 	\new Voice {
%  	  \voiceThree
%  	  \relative {
%  	  \mergeDifferentlyHeadedOn
%  	  \mergeDifferentlyDottedOn
%        \partial 4 s4  
%  		\repeat unfold 32 {s2.}
%	    s2 s8 
%	    \once \omit Stem
%	    \once \omit Flag e'~ e2 s8
%	    \once \omit Stem
%	    \once \omit Flag e~ e2 s8
%	    \once \omit Stem
%	    \once \omit Flag e~ e2 s8
%	  }
%	}
  >>
}

barOneToThirtySevenLower =  {
  <<
  \new Voice {
    \voiceOne
    \relative {
    \partial 4 s4 
    s2.
    
    %bar 2
    fis'4 e s
    \repeat unfold 7 {s2.}
    
    %bar 10
    fis4 e s
    \repeat unfold 8 {s2.}
    
    %bar 19
    
    \colorSoucyHaydnRetro
    g4\glissando^\markup \with-color "DarkRed" \box "12" d\glissando d\glissando
    
    %bar 20
    a\glissando b2~
    
    %bar 21
    4 
    \colorRevert
    
    
    cis 
    \colorDavePartialInv
    d\glissando^\markup \with-color "darkmagenta" \box "A"
    
    %bar 22
    e\glissando b\glissando fis
    \colorRevert
    %bar 23
    s2.
    
    %bar 24
    d4\rest b b'
   	\clef treble
    
    
    \colorSoucyHaydnRetroInv
    d!\glissando^\markup \with-color "darkgreen" \box "14" 
    g\glissando g\glissando
    cis\glissando b2
    \colorRevert
    
    %bar 27
    \colorSoucyHaydnRetro
    gis'4\glissando^\markup \with-color "DarkRed" \box "16" dis4\glissando dis\glissando
    ais\glissando b2
    \colorRevert

    %bar 29
    s2. s2.

	%bar 31
	
    %s4 
    \colorSoucyHaydnRetro
    gis4\glissando^\markup \with-color "DarkRed" \box "19" dis\glissando dis\glissando
	ais\glissando b2
	\colorRevert
	
	%bar 33
	\colorSoucyHaydnRetro
	c!4\glissando^\markup \with-color "DarkRed" \box "20" g\glissando g\glissando
	d\glissando e2~ 
	4 
	\colorRevert
	
	g ais

	%bar 36
	%\colorSoucyOneOverAlpha
	c! 
	%\colorRevert
	
	ais g
	
	%bar 37
	
	e ais, fis  
	
	%bar 38
    g'4\rest g4\rest
	<dis a'!>4~ 4
	<e ais> <eis b'>~ 4
	<fis c'!> <gis d'!>~ 4
	<a! dis> 		
	<b eis>~ 4
	<c fis> <dis a'>~ 4
	<e a> r
	
	%bar 44
	\repeat unfold 7 {s2.}
	r4 g,2
	%s2 
	
	%bar 52
	\colorSoucyHaydn
	b4\glissando^\markup \with-color "red" \box "28" a\glissando
	d,\glissando
	d\glissando g,2
	\colorRevert
	g, d''4\rest
	\bar "|."
    }
  }
  \new Voice {
    \voiceTwo
    \relative {
    d4\rest  
    %bar 1
    a' b d,\rest
    
    %bar 2
    <e b'>2 d4\rest
    
    %bar 3
    <c g'>2 
    
    %\colorSoucyAlpha
    <d c'>4
    %\colorRevert
    
    <d g,>2 
    <b fis'>4~
    %\colorSoucyAlpha
    2 
    %\colorRevert
    
    <fis' b,>4~
    %\colorSoucyAlpha
    2
    %\colorRevert
    <b, fis'>4
    
    %bar 7
    %\colorSoucyOneOverAlpha
    <b' e, a,>2.
    %\colorRevert
    
    %bar 8
    \stemUp
    a,4 d, d'4\rest  
    \stemNeutral
    
    %bar 9
    a' b d,\rest
    
    %bar 10
    <e b'>2 d4\rest
    
    %bar 11
    <c g'>2 
    
    %\colorSoucyAlpha
    <d c'>4
    %\colorRevert
    
    %bar 12
    <d g,>2 <b fis'>4~
    
    %bar 13
    %\colorSoucyAlpha
    2
    %\colorRevert
    
     <fis' b,>4~
     
    %bar 14
    %\colorSoucyAlpha
    2 
    %\colorRevert
    <b, fis'>4
    
    %bar 15
    %\colorSoucyOneOverAlpha
    <b' e, a,>2.
    %\colorRevert
    
    %bar 16
    \stemUp 
    a,4 d,
    \stemDown
    
    \colorSoucyHaydn
    b''~^\markup \with-color "red" \box "11"
    
    %bar 17
    4\glissando a\glissando d,\glissando
    
    %bar 18
    d\glissando g,2~ 
    
    %bar 19
    2.~ 
    
    %bar 20
    2.
    \colorRevert
    
    %bar 21
    \colorDavePartial
    g'2.~_\markup \with-color "red" \box "13" 2\glissando fis4~
    4\glissando b,2\glissando
    
    %bar 24
    e,2. 
    \colorRevert


    %bar 25
    <b'' d>2.

    <<
    {
    	%bar 26-28
    	g'2.
	    <eis~ b'>
    	eis
    	
    	%bar 29-30
    	\clef bass
	    %\colorSoucyOneOverAlpha
    	s2. s2. 
    	%\colorRevert
    	%s2.

	    %bar 31-32
    	b2.
	    s2.
	    %bar 33-34
		s2. s2.
		
		%bar 35-43
		\repeat unfold 9 {s2.}
    }
    { 
	\new Voice { \voiceFour
		\override Glissando.breakable = ##t
		\override Glissando.after-line-breaking = ##t
		%bar 26-28
		\colorSoucyHaydn
		d2.\glissando_\markup \with-color "red" \box "15'"
		cis~ cis\glissando
		%bar 29-32
		\clef bass
		cis,2.~cis!2.\glissando
		2.~cis!2.\glissando 
		%\colorRevert
		
		 %bar 33-34
	    %\colorSoucyHaydn
    	fis,~ | 2.\glissando
 		%\colorRevert
		
		%bar 35
   		%\colorSoucyHaydn
    	fis~ 
    	%\colorRevert

		%bar 36
		%\colorSoucyOneOverAlpha
		%\override Tie.color = #(x11-color 'red)
	
		2.~ 
		%\colorRevert

		%bar 37-43
		%\colorSoucyHaydn
		2.\glissando
		b,2.~ 2.~ 4.\glissando 
		%\colorRevert
		b4.~ 2.~ 4. \glissando b4.~ 2.
   		\colorRevert
	}
    }
    >>
    
	
	%bar 44
	\stemUp 
	\colorDavePartial
	b2.\glissando_\markup \with-color "orange" \box "24" 
	a2\glissando 
	d4\glissando 
	g, 
	\colorRevert
	r <g' d'>~
	2 4~ 2 
	\stemDown <c g' e'>4
	
	%bar 49
	
	%\colorSoucyAlpha
	<e d'>2 
	%\colorRevert
	<a, g'!>4
	
	%bar 50
	%\colorSoucyAlpha
	<e' d'>2 
	%\colorRevert
	
	<a, g'!>4
	ees2 aes4
	d,!2.
    }
  }
  \new Voice {
  	\voiceThree
  	\relative {
  		\partial 4 s4  
  		\repeat unfold 17 {s2.}
  	    d2.~ \stemDown 2.~ 2.
   		\repeat unfold 17 {s2.}
  	}
  }
  \new Voice {
  	\voiceFour
  	\relative {
  		\partial 4 s4  
  		\repeat unfold 37 {s2.}
  		s4 b,2
  	}
  }
  >>
}


upper = \relative c' {
  %\mergeDifferentlyHeadedOn
  \clef treble
  \key g \major
  \time 3/4
  \barOneToThirtySevenUpper	
}

lower = \relative c {  
  %\mergeDifferentlyHeadedOn
  \clef bass
  \key g \major
  \time 3/4
  \barOneToThirtySevenLower
}

\score {
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
  \midi { }
}
