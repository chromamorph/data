\version "2.22.2"

#(set-global-staff-size 16)
barOneToThirtySevenUpper =  {
  <<
  	\new Voice {
  	  \voiceOne
  	  \relative {
	  \partial 4 b'4~ 
	  4 a d
	  %bar 2
	  d g <d b>~
	  4 <a c>8 <g b> <e g> <fis a>
	  <fis a>4 <g b> d'8 e
	  \grace {d32 e} <d fis cis'>4 <cis e b'> d8 e

	  %bar 6
	  \grace {d32 e} <d fis cis'>4 <cis e b'> d8 e
	  \grace {d32 e} <d fis g,>4 e8 fis d cis
	  cis4 d b~
	  4 a d
	  d g <d b>~
	  4 <a c>8 <g b> <e g> <fis a>

	  %bar 12
	  <fis a>4 <g b> d'8 e
	  \grace {d32 e} <d fis cis'>4 <cis e b'> d8 e
	  \grace {d32 e} <d fis cis'>4 <cis e b'> d8 e
	  \grace {d32 e} <d fis g,>4 e8 fis d cis
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
	  <b d! g!>4. a'!8 fis e

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
	  4 c ais
	  \stemUp
	  
	  %bar 37
	  d!8 c g a! d, c
	  \clef treble
	  
	  %bar 38
	  b''4\rest b4\rest <d! fis a! d!>~
	  4 <c e g c> <g b e! g>~
	  4 <fis a dis fis> <c'! e gis c!>~
	  4 <b dis eis b'> <e,! b' e!>~
	  4 <d d'> <fis' b>~4
	  <a g> d,!
	  
	  %bar 44
	  d4 g <d b>~ 4
	  <a c>8 <g b> <e g> <fis a>
	  <fis a>4 <g b> f'!8 g
	  \grace{f!32 g} <e a e'>4 <d g d'>
	  f!8 g
	  \grace{f!32 g} <e a e'>4 <d g d'>
	  c'4
	  
	  %bar 49
	  \grace{c,32 d} e2 s4
	  e2 s4
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
  	  <d fis cis'>4 <cis e b'> s
  	  <d fis cis'>4 <cis e b'> s
	  
	  %bar 7
	  s <e g b>2
	  <d fis a> 
	  <c! e g>4~
	  4 <d fis> r
  	  <g b>2 r4
  	  e2 s4
  	  b2 r4
  	  <d fis cis'>4 <cis e b'> s
  	  
  	  %bar 14
  	  <d fis cis'>4 <cis e b'> s
	  s <e g b>2
	  <d fis a> s4
	  c2. 
	  b2.
	  <fis' b>2 <e a>4

	  %bar 20
	  <fis b>2 <e a>4
	  <fis~ b>2 fis4
	  cis <b d> <a cis>
	  <cis e> <b dis> <a cis>
	  <cis e>2 dis4
	  s2.
	  d'2.

	  %bar 27
	  s2 s8 
	  \once \omit Stem 
	  \once \omit Flag 
	  dis8~ 2.
	  g,!4 d d
	  a b2
	  gis'4 s2
	  s2.
	  
	  %bar 33
	  <ais, e'>2.
	  
	  %bar 34
	  \stemUp
	  g'!4. a!8 fis e~
	  
	  %bar 35
	  \stemDown
	  <ais, e'>2.
	  
	  %bar 36
	  \stemUp
	  g'8 a! fis e
	  \clef bass
	  dis e
	  
	  %bar 37
	  \stemDown
	  g,4 e e

	  %bar 38
	  s4 s ais
	  b c! cis
	  d dis dis
	  e eis g!
	  gis a b
	  bis cis
	  <fis, c'!>
	  
	  %bar 44
	  <a b>4~ <g b> fis
	  e2 c4 
	  b2 r4
	  <b f'! a>4 <d g b> r
	  <b f'! a>4 <d g b> c'8 d
	  <gis, c>4 <fis b>8 c' <c, e> g'!
	  <gis c>4 <fis b>8 c' <c, e> g'!
	  <des f>2 c4 b a s
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
    fis'4 e s
    \repeat unfold 7 {s2.}
    fis4 e s
    \repeat unfold 8 {s2.}
    g4 d d
    a b2~
    4 cis d
    e s2
    s2.
    d,4\rest b b'
    \clef treble
    d! g g
    cis b2
    gis'4 dis4 dis
    ais b2
    s2. s2.
    s4 dis, dis
	ais b2
	c!4 g g
	d e2~ 
	4 g ais
	c! ais g
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
	s2 d4
	d g,2
	g, d''4\rest
	\bar "|."
    }
  }
  \new Voice {
    \voiceTwo
    \relative {
    d4\rest  a' b d,\rest
    <e b'>2 d4\rest
    <c g'>2 <d c'>4
    <d g,>2 <b fis'>4~
    2 <fis' b,>4~
    2 <b, fis'>4
    <b' e, a,>2.
    \stemUp
    a,4 d, d'4\rest  
    \stemNeutral
    
    a' b d,\rest
    <e b'>2 d4\rest
    <c g'>2 <d c'>4
    <d g,>2 <b fis'>4~
    2 <fis' b,>4~
    2 <b, fis'>4
    <b' e, a,>2.
    \stemUp 
    a,4 d,
    \stemDown
    
    b''~
    4 a d,
    d g,2~ 2.~ 2.
    g'2.~ 2 fis4~
    4 b,2
    e,2. 
    <b'' d>2.
    <d g>
    <cis~ eis~ b'>2.
    <cis eis>2.
    \clef bass
    cis, 2.~ 2.
    <cis~ b'>2.
    cis
    fis,~ 2.
    fis~ 2.~ 2.
    \repeat unfold 6 {s2.}
	
	%bar 44
	\stemUp b,2. a2 d4 
	g, r <g' d'>~
	2 4~ 2 
	\stemDown <c g' e'>4
	
	%bar 49
	<e d'>2 <a, g'!>4
	<e' d'>2 <a, g'!>4
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
		b,2.~ 2.~ 4. b4.~ 2.~ 4. b4.~ 2.

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
