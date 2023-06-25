\version "2.22.2"

%Encoded by David Meredith
%Started: 22 June 2023
%Completed: 
%Encoded from pages 125-126 of 
%"Piano Masterpieces of Ravel", Dover Publications, Inc., New York. ISBN: 0-486-25137-3, 1986.
% Facsimile of edition of Durand et Cie. 
\header {
	tagline = ""
}


upper = \relative c'' {
  \clef treble
  \key g \major
  \time 3/4

  \partial 4 b4( b) a d
}

lower = \relative c {
  \clef bass
  \key g \major
  \time 3/4

\partial 4 r4 a' b r
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
