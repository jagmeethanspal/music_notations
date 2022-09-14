# Music Notations
Indian and Western (etc) Music Notation(s) as well as mapping of the Sur [^1] (notes)

## Current Support
We use a Perl module to cover the following musical notations:

### Western Notes 
`C D E F G A B`      (along with their _Flat_ and _Sharp_ counterparts)

### Indian (Hindustani) Notes
`Sa Re Ga Ma Pa Dha Ni`      (along with their _Komal_[^2] and _Tivra_[^3] variants)

## Reasoning, Rules, Requirements and Cautions for notations
### Indian Musical Notation
In the Indian Musical Notation context:
Some have used: `Sa Re Ga Ma... etc`, while others use `S, R, G... etc`   (both are necessarily the same)

However, in order to cover the variationts, some experts use lower-case for _komal_ (flat/b) or upper-case for _tivra_ (sharp/#) notes. This notation leads to some complications.

#### Problems with Lower and Upper Case
- First of all there is no upper or lower case in (most?) Indian Languages (eg Hindi), it is only through use of English that this option even exists.
- Secondly, this does not leave a room for _shuddha_ (pure/perfect) notes (as you need atleast 3 demarcations, one each for Flat, Peferct/Major and Sharp notes). 
- As it is required to have separate notation for flat/pure/sharp (i.e. b/<none>/#) just using upper and lower-case and multiplexing that for pure/perfect/shuddha causes collision/confusion.
  - The _sur_ (note) `Ma` is Perfect-Fourth has no _komal_ (flat) but only a _tivra_ (sharp) variant. But, still using mixed upper/lower case it is forced to be denoted with `ma` so as to leave room for the _tivra_ (sharp) variant `Ma`
  - Using this notation while ok for encoding in English, makes the major scale (_Bilawal thaat_) look like the following:   
    `S R G m P D N S'`   (while technically it denotes it but seems semantically incorrect for a Major-scale with a lower-case `m`)

- Also, as a caution on Windows based systems (while the western counterparts are all different, for eg. D and Dd or D#) the Indian notes re.mp3 and Re.mp3 point to the  same file (as Windows file-system is case in-senstive). That is, while for Sargam notation we can continue to denote as: `Sa, re, Re, ga, Ga...` but in-order to have unique file-names for individual notes across Linux/Windows, we cannot intermix upper & lower case (eg. on Windows systems). This problem is not faced with Western notation.
- The higher and lower ocatves (saptak[^4]) also require their own notation(s) too.

## Our notation
Major Scale: `Sa Re Ga Ma Pa Dha Ni Sa` (C D E F G A B)   
All Notes:   `Sa kRe Re kGa Ga Ma tMa Pa kDha Dha kNi Sa+` (C3 Db3 D3 Eb3 E3 F3 Gb3 G3 Ab3 A3 Bb3 B3 C4)   

Using the vocal sound `Sa, Re, Ga` (instead of just `S, R, G`) has benefits:
- It denotes the actual vowel sounds.
- Naming of notes are all unique across different systems like Linux or Windows
- Major scale etc are well represented without confusion or collisions due to lack of namespace.
- We use  `kRe` (or re-komal or Re-komal, equivalent for for D-minor or Dd or D-flat) etc instead of lower-case "re/r"
- Along with lower/medium/higher octave it becomes:   
  - `kRe-`  for _Mandra saptak_ (or lower octave)
  - `kRe`  for _Madhya saptak_ (or middle octave)
  - `kRe+` for _Taar saptak_ (or higher octave)   
  (This also avoids using ' (or special character) for higher/lower ocatves)

- As Western notes, even the Indian notes can be augmented with octaves (eg `Sa3, Pa3, Sa4`). However,
  - For human vocal-range, an ocatve lower and higher from the standard is enough thus `Pa-, Sa, Pa, Sa+, Pa+` suffices.
  - For musical instrucments (eg a mechanical Piano etc) full notation of the ocatve numbers become crucial.

## Footnotes
[^1]: Sur = Note(s)
[^2]: Komal = Flat note (b)
[^3]: Tivra = Sharp note (#)
[^4]: Saptak / Sargam = An Octave

