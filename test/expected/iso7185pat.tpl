*******************************************************************************

                 TEST SUITE FOR ISO 7185 PASCAL

                 Copyright (C) 1995 S. A. Moore - All rights reserved

*******************************************************************************

The following are implementation defined characteristics

Maxint: 2147483647
Bit length of integer without sign bit appears to be: 31
Integer default output field
         1111111111222222222233333333334
1234567890123456789012345678901234567890
1
Real default output field
         1111111111222222222233333333334
1234567890123456789012345678901234567890
 1.200000E+00
Note that the exponent character 'e' or 'E' is implementation
defined as well as the number of exponent digits
Boolean default output field
         1111111111222222222233333333334
1234567890123456789012345678901234567890
FALSE
TRUE
Note that the upper or lower case state of the characters in
'true' and 'false' are implementation defined
Char default output field
         1111111111222222222233333333334
1234567890123456789012345678901234567890
a
Appears to be ASCII

******************* Control structures tests *******************

Control1: 1 2 3 4 5 6 7 8 9 10 s/b 1 2 3 4 5 6 7 8 9 10
Control2: 10 9 8 7 6 5 4 3 2 1 s/b 10 9 8 7 6 5 4 3 2 1
Control3: 1 2 3 4 5 6 7 8 9 10 s/b 1 2 3 4 5 6 7 8 9 10
Control4: 1 2 3 4 5 6 7 8 9 10 s/b 1 2 3 4 5 6 7 8 9 10
Control5: 1 2 3 4 5 6 7 8 9 10 s/b 1 2 3 4 5 6 7 8 9 10
Control6: yes s/b yes
Control7: yes s/b yes
Control8: yes stop s/b yes stop
Control9: stop s/b stop
Control10: one two three four five six seven eight nine-ten nine-ten 
Control10: s/b one two three four five six seven eight nine-ten nine-ten
Control12: start stop s/b start stop
Control13: start   1  2  3  4  5  6  7  8  9 10 s/b   1  2  3  4  5  6  7  8  9 10
Control14: start  10  9  8  7  6  5  4  3  2  1 s/b  10  9  8  7  6  5  4  3  2  1
Control15: start  0 1 2 3 4 5 6 7 8 9 s/b 0 1 2 3 4 5 6 7 8 9
Control16: start  9 8 7 6 5 4 3 2 1 0 s/b 9 8 7 6 5 4 3 2 1 0
Control17: start good start s/b good

******************* Integers *******************

Integer1:   121 s/b 121
Integer2:   35 s/b 35
Integer3:   3354 s/b 3354
Integer4:   1 s/b 1
Integer5:   35 s/b 35
Integer6:   44 s/b 44
Integer7:   42 s/b 42
Integer8:   1849 s/b 1849
Integer9:   N s/b N
Integer10:  43 s/b 43
Integer11:   TRUE s/b true
Integer12:  FALSE s/b false
Integer13:   TRUE s/b true
Integer14:  FALSE s/b false
Integer15:   TRUE s/b true
Integer16:  FALSE s/b false
Integer17:   TRUE s/b true
Integer18:  FALSE s/b false
Integer19:   TRUE s/b true
Integer20:  FALSE s/b false
Integer21:   TRUE s/b true
Integer22:   TRUE s/b true
Integer23:  FALSE s/b false
Integer24:   TRUE s/b true
Integer25:   TRUE s/b true
Integer26:  FALSE s/b false
Integer27:  546 s/b 546
Integer28:  90 s/b 90
Integer29:  22 s/b 22
Integer30:  1904 s/b 1904
Integer31:  1 s/b 1
Integer32:  22 s/b 22
Integer33:  6 s/b 6
Integer34:  4 s/b 4
Integer35:  49 s/b 49
Integer36:  A s/b A
Integer37:  65 s/b 65
Integer38:  768 s/b 768
Integer39:   TRUE s/b true
Integer40:  FALSE s/b false
Integer41:   TRUE s/b true
Integer42:  FALSE s/b false
Integer43:   TRUE s/b true
Integer44:  FALSE s/b false
Integer45:   TRUE s/b true
Integer46:  FALSE s/b false
Integer47:   TRUE s/b true
Integer48:  FALSE s/b false
Integer49:   TRUE s/b true
Integer50:   TRUE s/b true
Integer51:  FALSE s/b false
Integer52:   TRUE s/b true
Integer53:   TRUE s/b true
Integer54:  FALSE s/b false
Integer55:  6 s/b 6
Integer56:  6 s/b 6
Integer57:  -12 s/b -12
Integer58:  -46 s/b -46
Integer59:  34 s/b 34
Integer60:  -52 s/b -52
Integer61:  -18 s/b -18
Integer62:  -280 s/b -280
Integer63:  -280 s/b -280
Integer64:  448 s/b 448
Integer65:  -1 s/b -1
Integer66:  -1 s/b -1
Integer67:  2 s/b 2
Integer68:  -13 s/b -13
Integer69:  -33 s/b -33
Integer70: 196 s/b 196
Integer71:  FALSE s/b false
Integer72:   TRUE s/b true
Integer73:   TRUE s/b true
Integer74:  FALSE s/b false
Integer75:   TRUE s/b true
Integer76:  FALSE s/b false
Integer77:   TRUE s/b true
Integer78:   TRUE s/b true
Integer79:  FALSE s/b false
Integer80:  FALSE s/b false
Integer81:   TRUE s/b true
Integer82:   TRUE s/b true
Integer83:  FALSE s/b false
Integer84:  FALSE s/b false
Integer85:   TRUE s/b true
Integer86:   TRUE s/b true
Integer87:   TRUE s/b true
Integer88:  FALSE s/b false
Integer89:  FALSE s/b false
Integer90:   TRUE s/b true
Integer91:   TRUE s/b true
Integer92:   TRUE s/b true
Integer93:  FALSE s/b false
Integer94:  FALSE s/b false
Integer95:  14 s/b 14
Integer96:  0 s/b 0
Integer97:  0 s/b 0
Integer98:  0 s/b 0
Integer99:  15 s/b 15
Integer100:  45 s/b 45
Integer101: -39 s/b -39
Integer102: -35 s/b -35
Integer103: 34 s/b 34
Integer104: -48 s/b -48
Integer105: -44 s/b -44
Integer106: -20 s/b -20
Integer107: -126 s/b -126
Integer108: 520 s/b 520
Integer109: -6 s/b -6
Integer110: -25 s/b -25
Integer111: 5 s/b 5
Integer112: -9 s/b -9
Integer113: 0 s/b 0
Integer114: -2 s/b -2
Integer115: 64 s/b 64
Integer116: -55 s/b -55
Integer117: FALSE s/b false
Integer118:  TRUE s/b true
Integer119:  TRUE s/b true
Integer120: FALSE s/b false
Integer121:  TRUE s/b true
Integer122: FALSE s/b false
Integer123:  TRUE s/b true
Integer124:  TRUE s/b true
Integer125: FALSE s/b false
Integer126: FALSE s/b false
Integer127:  TRUE s/b true
Integer128:  TRUE s/b true
Integer129: FALSE s/b false
Integer130: FALSE s/b false
Integer131:  TRUE s/b true
Integer132:  TRUE s/b true
Integer133:  TRUE s/b true
Integer134: FALSE s/b false
Integer135: FALSE s/b false
Integer136:  TRUE s/b true
Integer137:  TRUE s/b true
Integer138:  TRUE s/b true
Integer139: FALSE s/b false
Integer140: FALSE s/b false
Integer141: 6 s/b 6
Integer142: -52 s/b -52
Integer143: 52 s/b 52
Integer144: -768 s/b -768
Integer145: 52 s/b 52
Integer146: 0 s/b 0

******************* Subranges *******************

Subrange1:   121 s/b 121
Subrange2:   35 s/b 35
Subrange3:   3354 s/b 3354
Subrange4:   1 s/b 1
Subrange5:   35 s/b 35
Subrange6:   44 s/b 44
Subrange7:   42 s/b 42
Subrange8:   N s/b N
Subrange9:   43 s/b 43
Subrange10:   TRUE s/b true
Subrange11:  FALSE s/b false
Subrange12:   TRUE s/b true
Subrange13:  FALSE s/b false
Subrange14:   TRUE s/b true
Subrange15:  FALSE s/b false
Subrange16:   TRUE s/b true
Subrange17:  FALSE s/b false
Subrange18:   TRUE s/b true
Subrange19:  FALSE s/b false
Subrange20:   TRUE s/b true
Subrange21:   TRUE s/b true
Subrange22:  FALSE s/b false
Subrange23:   TRUE s/b true
Subrange24:   TRUE s/b true
Subrange25:  FALSE s/b false
Subrange26:  6 s/b 6
Subrange27:  6 s/b 6
Subrange28:  -12 s/b -12
Subrange29:  -46 s/b -46
Subrange30:  34 s/b 34
Subrange31:  -52 s/b -52
Subrange32:  -18 s/b -18
Subrange33:  -280 s/b -280
Subrange34:  -280 s/b -280
Subrange35:  448 s/b 448
Subrange36:  -1 s/b -1
Subrange37:  -1 s/b -1
Subrange38:  2 s/b 2
Subrange39:  -13 s/b -13
Subrange40:  -33 s/b -33
Subrange41:  FALSE s/b false
Subrange42:   TRUE s/b true
Subrange43:   TRUE s/b true
Subrange44:  FALSE s/b false
Subrange45:   TRUE s/b true
Subrange46:  FALSE s/b false
Subrange47:   TRUE s/b true
Subrange48:   TRUE s/b true
Subrange49:  FALSE s/b false
Subrange50:  FALSE s/b false
Subrange51:   TRUE s/b true
Subrange52:   TRUE s/b true
Subrange53:  FALSE s/b false
Subrange54:  FALSE s/b false
Subrange55:   TRUE s/b true
Subrange56:   TRUE s/b true
Subrange57:   TRUE s/b true
Subrange58:  FALSE s/b false
Subrange59:  FALSE s/b false
Subrange60:   TRUE s/b true
Subrange61:   TRUE s/b true
Subrange62:   TRUE s/b true
Subrange63:  FALSE s/b false
Subrange64:  FALSE s/b false
Subrange65:  14 s/b 14

******************* Characters*******************

Character1:   g g u s/b g g u
Character2:   h s/b h
Character3:   f s/b f
Character4:   103 s/b 103
Character5:   u s/b u
Character6:    TRUE s/b true
Character7:   FALSE s/b false
Character8:    TRUE s/b true
Character9:   FALSE s/b false
Character10:   TRUE s/b true
Character11:  FALSE s/b false
Character12:   TRUE s/b true
Character13:  FALSE s/b false
Character14:   TRUE s/b true
Character15:   TRUE s/b true
Character16:  FALSE s/b false
Character17:   TRUE s/b true
Character18:   TRUE s/b true
Character19:  FALSE s/b false
Character20:  porker    porker    parker     s/b porker    porker    parker
Character21:   TRUE s/b true
Character22:  FALSE s/b false
Character23:   TRUE s/b true
Character24:  FALSE s/b false
Character25:   TRUE s/b true
Character26:  FALSE s/b false
Character27:   TRUE s/b true
Character28:  FALSE s/b false
Character29:   TRUE s/b true
Character30:   TRUE s/b true
Character40:  FALSE s/b false
Character41:   TRUE s/b true
Character42:   TRUE s/b true
Character43:  FALSE s/b false
Character44:  abcdefghijklmnopqrstuvwxyz s/b abcdefghijklmnopqrstuvwxyz
Character45:  zyxwvutsrqponmlkjihgfedcba s/b zyxwvutsrqponmlkjihgfedcba
Character46:  25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0 
Character46: s/b 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0
Character47: n s/b n
Character48: junky01234 s/b junky01234
Character49:  
crapola   
0123456789
0123456789
0123456789
0123456789
0123456789
0123456789
0123456789
finnork   
trash     
Character49: s/b
crapola
0123456789
0123456789
0123456789
0123456789
0123456789
0123456789
0123456789
finnork
trash
Character50:  
zero one two three four five six seven eight nine 
 s/b zero one two three four five six seven eight nine
Character51:  a s/b a
Character52:  b s/b b
Character53:  y s/b y
Character54:  99 s/b 99
Character55:  g s/b g
Character56:   TRUE s/b true
Character57:  FALSE s/b false
Character58:   TRUE s/b true
Character59:  FALSE s/b false
Character50:   TRUE s/b true
Character61:  FALSE s/b false
Character62:   TRUE s/b true
Character63:  FALSE s/b false
Character64:   TRUE s/b true
Character65:   TRUE s/b true
Character66:  FALSE s/b false
Character67:   TRUE s/b true
Character68:   TRUE s/b true
Character69:  FALSE s/b false
Character70:   TRUE s/b true
Character71:  FALSE s/b false
Character72:   TRUE s/b true
Character73:  FALSE s/b false
Character74:   TRUE s/b true
Character75:  FALSE s/b false
Character76:   TRUE s/b true
Character77:  FALSE s/b false
Character78:   TRUE s/b true
Character79:   TRUE s/b true
Character80:  FALSE s/b false
Character81:   TRUE s/b true
Character82:   TRUE s/b true
Character83:  FALSE s/b false
Character84:  this is a string s/b this is a string
Character85:  v s/b v
Character86:  
   hello, world
  hello, world
 hello, world
hello, world
hello, worl
hello, wor
hello, wo
hello, w
hello, 
hello,
hello
hell
hel
he
h
Character86:  s/b:
   hello, world
  hello, world
 hello, world 
hello, world
hello, worl
hello, wor
hello, wo
hello, w
hello, 
hello,
hello
hell
hel
he
h

******************* Booleans *******************

Boolean1:    TRUE FALSE s/b true false
Boolean2:    TRUE s/b true
Boolean3:   FALSE s/b false
Boolean4:   0 s/b 0
Boolean5:   1 s/b 1
Boolean6:    TRUE s/b true
Boolean7:    TRUE s/b true
Boolean8:   FALSE s/b false
Boolean9:    TRUE s/b true
Boolean10:  FALSE s/b false
Boolean11:   TRUE s/b true
Boolean12:  FALSE s/b false
Boolean13:   TRUE s/b true
Boolean14:  FALSE s/b false
Boolean15:   TRUE s/b true
Boolean16:   TRUE s/b true
Boolean17:  FALSE s/b false
Boolean18:   TRUE s/b true
Boolean19:   TRUE s/b true
Boolean20:  FALSE s/b false
Boolean21:  FALSE  TRUE s/b false true
Boolean22:   TRUE FALSE s/b true false
Boolean23:   TRUE s/b true
Boolean24:  FALSE s/b false
Boolean25:   TRUE FALSE s/b true false
Boolean26:   TRUE s/b true
Boolean27:  FALSE s/b false
Boolean28:  0 s/b 0
Boolean29:  1 s/b 1
Boolean30:   TRUE s/b true
Boolean31:   TRUE s/b true
Boolean32:  FALSE s/b false
Boolean33:   TRUE s/b true
Boolean34:  FALSE s/b false
Boolean35:   TRUE s/b true
Boolean36:  FALSE s/b false
Boolean37:   TRUE s/b true
Boolean38:  FALSE s/b false
Boolean39:   TRUE s/b true
Boolean40:   TRUE s/b true
Boolean41:  FALSE s/b false
Boolean42:   TRUE s/b true
Boolean43:   TRUE s/b true
Boolean44:  FALSE s/b false
Boolean45:
     FALSE
    FALSE
   FALSE
  FALSE
 FALSE
FALSE
FALSE
FALSE
FALSE
FALSE
Boolean45: s/b:
     false
    false
   false
  false
 false
false
fals
fal
fa
f
Boolean46:
      TRUE
     TRUE
    TRUE
   TRUE
  TRUE
 TRUE
TRUE
TRUE
TRUE
TRUE
Boolean46: s/b:
      true
     true
    true
   true
  true
 true
true
tru
tr
t

******************* Scalar *******************

Scalar1:    TRUE s/b true
Scalar2:    TRUE s/b true
Scalar3:   0 s/b 0
Scalar4:   2 s/b 2
Scalar5:    TRUE s/b true
Scalar6:    TRUE s/b true
Scalar7:   FALSE s/b false
Scalar8:    TRUE s/b true
Scalar9:   FALSE s/b false
Scalar10:   TRUE s/b true
Scalar11:  FALSE s/b false
Scalar12:   TRUE s/b true
Scalar13:  FALSE s/b false
Scalar14:   TRUE s/b true
Scalar15:   TRUE s/b true
Scalar16:  FALSE s/b false
Scalar17:   TRUE s/b true
Scalar18:   TRUE s/b true
Scalar19:  FALSE s/b false
Scalar20:  0 1 2 3 4 5 6 s/b 0 1 2 3 4 5 6
Scalar21:  6 5 4 3 2 1 0 s/b 6 5 4 3 2 1 0
Scalar1:    TRUE s/b true
Scalar2:    TRUE s/b true
Scalar3:   2 s/b 2
Scalar4:   6 s/b 6
Scalar5:    TRUE s/b true
Scalar6:    TRUE s/b true
Scalar7:   FALSE s/b false
Scalar8:    TRUE s/b true
Scalar9:   FALSE s/b false
Scalar10:   TRUE s/b true
Scalar11:  FALSE s/b false
Scalar12:   TRUE s/b true
Scalar13:  FALSE s/b false
Scalar14:   TRUE s/b true
Scalar15:   TRUE s/b true
Scalar16:  FALSE s/b false
Scalar17:   TRUE s/b true
Scalar18:   TRUE s/b true
Scalar19:  FALSE s/b false

******************* Reals ******************************

Real1:    1.55400000E+00 s/b  1.554000e+00
Real2:    3.34000000E-03 s/b  3.340000e-03
Real3:    3.34000000E-24 s/b  3.34000e-24
Real4:    4.00000000E-45 s/b  4.000000e-45
Real5:   -5.56500000E+00 s/b -5.565000e+03
Real6:   -9.44000000E-03 s/b -9.440000e-03
Real7:   -6.36400000E+29 s/b -6.364000e+29
Real8:   -2.00000000E-14 s/b -2.000000e-14
Real9:
         11111111112222222222333333333344444444445
12345678901234567890123456789012345678901234567890
 1.2E+00
 1.2E+00
 1.2E+00
 1.2E+00
 1.2E+00
 1.2E+00
 1.2E+00
 1.2E+00
 1.23E+00
 1.235E+00
 1.2346E+00
 1.23457E+00
 1.234568E+00
 1.2345679E+00
 1.23456789E+00
 1.234567890E+00
 1.2345678901E+00
 1.23456789012E+00
 1.234567890123E+00
 1.2345678901235E+00
s/b (note precision dropoff at right):
 1.2e+000
 1.2e+000
 1.2e+000
 1.2e+000
 1.2e+000
 1.2e+000
 1.2e+000
 1.2e+000
 1.2e+000
 1.23e+000
 1.234e+000
 1.2345e+000
 1.23456e+000
 1.234567e+000
 1.2345678e+000
 1.23456789e+000
 1.234567890e+000
 1.2345678901e+000
 1.23456789012e+000
 1.234567890123e+000
Real10:
         11111111112222222222333333333344444444445
12345678901234567890123456789012345678901234567890
1.2
2.23
3.235
4.2346
5.23457
6.234568
7.2345679
8.23456789
9.234567890
10.2345678901
11.23456789012
12.234567890123
13.2345678901235
14.23456789012346
15.234567890123456
16.2345678901234578
17.23456789012345780
18.234567890123457801
19.2345678901234578007
20.23456789012345780066
s/b (note precision dropoff at right):
1.2
2.23
3.234
4.2345
5.23456
6.234567
7.2345678
8.23456789
9.234567890
10.2345678901
11.23456789012
12.234567890123
13.2345678901234
14.23456789012345
15.234567890123456
16.2345678901234567
17.23456789012345678
18.234567890123456789
19.2345678901234567890
20.23456789012345678901
Real11:   1.41890000E+03 s/b  1.418900e+03
Rea112:   5.48440000E+02 s/b  5.484399e+02
Real13:   4.28122694E+05 s/b  4.281227e+05
Real14:   2.26011534E+00 s/b  2.260115e+00
Real15:   TRUE s/b true
Real16:  FALSE s/b false
Real17:   TRUE s/b true
Real18:  FALSE s/b false
Real19:   TRUE s/b true
Real20:  FALSE s/b false
Real21:   TRUE s/b true
Real22:  FALSE s/b false
Real23:   TRUE s/b true
Real24:   TRUE s/b true
Real25:  FALSE s/b false
Real26:   TRUE s/b true
Real27:   TRUE s/b true
Real28:  FALSE s/b false
Real29:   4.35230000E+02 s/b  4.35230e+02
Real30:   1.89425153E+05 s/b  1.89425e+05
Real31:   3.13635138E+01 s/b  3.13635e+01
Real32:  -3.44305942E-01 s/b -3.44290e-01
Real33:   1.56849870E+00 s/b  1.56850e+00
Real34:   1.41100187E+00 s/b  1.41100e+00
Real35:   6.07587463E+00 s/b  6.07587e+00
Real36:  435 s/b 435
Real37:  984 s/b 984
Real38:  435 s/b 435
Real39:   1.27805200E+03 s/b  1.278052e+03
Real40:   2.38946000E+02 s/b  2.389460e+02
Real41:   1.04720175E+05 s/b  1.047202e+05
Real42:   7.25959751E-03 s/b  7.259598e-03
Real43:   TRUE s/b true
Real44:  FALSE s/b false
Real45:   TRUE s/b true
Real46:  FALSE s/b false
Real47:   TRUE s/b true
Real48:  FALSE s/b false
Real49:   TRUE s/b true
Real50:  FALSE s/b false
Real51:   TRUE s/b true
Real52:   TRUE s/b true
Real53:  FALSE s/b false
Real54:   TRUE s/b true
Real55:   TRUE s/b true
Real56:  FALSE s/b false
Real57:   3.49300000E+01 s/b  3.493000e+01
Real58:   5.47560000E+00 s/b  5.475600e+00
Real59:   9.72333276E+01 s/b  9.723333e+01
Real60:   3.31147273E-01 s/b  3.311461e-01
Real61:   1.56788258E+00 s/b  1.567883e+00
Real62:   1.39375285E+00 s/b  1.393753e+00
Real63:   4.42148770E+00 s/b  4.421488e+00
Real64:  24 s/b 24
Real65:  75 s/b 75
Real66:  83 s/b 83
Real67:   4.33300000E+01 s/b  4.333000e+01
Real68:   3.00340000E+02 s/b  3.003400e+02
Real69:   3.00340000E+02 s/b  3.003400e+02
Real70:  -6.59998000E+03 s/b -6.599980e+03
Real71:  -8.36872000E+03 s/b -8.368720e+03
Real72:   1.76874000E+03 s/b  1.768740e+03
Real73:  -8.66906000E+03 s/b -8.669061e+03
Real74:  -6.90032000E+03 s/b -6.900320e+03
Real75:  -7.59559268E+05 s/b -7.595593e+05
Real76:  -7.59559268E+05 s/b -7.595593e+05
Real77:   5.60526458E+06 s/b  5.605265e+06
Real78:  -1.40907110E+00 s/b -1.409071e+00
Real79:  -7.37962766E+00 s/b -7.379627e+00
Real80:   1.03984200E+01 s/b  1.039842e+01
Real81:   TRUE s/b true
Real82:  FALSE s/b false
Real83:   TRUE s/b true
Real84:  FALSE s/b false
Real85:   TRUE s/b true
Real86:   TRUE s/b true
Real87:  FALSE s/b false
Real88:  FALSE s/b false
Real89:   TRUE s/b true
Real90:   TRUE s/b true
Real91:  FALSE s/b false
Real92:  FALSE s/b false
Real93:   TRUE s/b true
Real94:   TRUE s/b true
Real95:   TRUE s/b true
Real96:  FALSE s/b false
Real97:  FALSE s/b false
Real98:   TRUE s/b true
Real99:   TRUE s/b true
Real100:  TRUE s/b true
Real101: FALSE s/b false
Real102: FALSE s/b false
Real103:  7.34200000E+02 s/b  7.34200e+02
Real104:  5.39049640E+05 s/b  5.39050e+05
Real105: -4.34832062E-01 s/b -4.34850e-01
Real106: -1.56943430E+00 s/b -1.56943e+00
Real107:  6.80566323E-01 s/b  6.80566e-01
Real108:            -734 s/b -734
Real109:           -7635 s/b -7635
Real110:            -734 s/b -734
Real111:  1.51000000E+01 s/b  1.510000e+01
Real112:  4.51330000E+01 s/b  4.513300e+01
Real113: -3.86400000E+01 s/b -3.864000e+01
Real114: -3.65810000E+01 s/b -3.658100e+01
Real115:  3.55480000E+01 s/b  3.554800e+01
Real116: -4.93984000E+01 s/b -4.939840e+01
Real117: -4.40010000E+01 s/b -4.400100e+01
Real118: -2.64122320E+01 s/b -2.641223e+01
Real119: -1.48904140E+02 s/b -1.489041e+02
Real120:  5.58563248E+02 s/b  5.585632e+02
Real121: -5.22015662E+00 s/b -5.220157e+00
Real122: -1.77216253E+01 s/b -1.772163e+01
Real123:  4.27458238E+00 s/b  4.274582e+00
Real124:  TRUE s/b true
Real125: FALSE s/b false
Real126:  TRUE s/b true
Real127: FALSE s/b false
Real128:  TRUE s/b true
Real129:  TRUE s/b true
Real130: FALSE s/b false
Real131: FALSE s/b false
Real132:  TRUE s/b true
Real133:  TRUE s/b true
Real134: FALSE s/b false
Real135: FALSE s/b false
Real136:  TRUE s/b true
Real137:  TRUE s/b true
Real138:  TRUE s/b true
Real139: FALSE s/b false
Real140: FALSE s/b false
Real141:  TRUE s/b true
Real142:  TRUE s/b true
Real143:  TRUE s/b true
Real144: FALSE s/b false
Real145: FALSE s/b false
Real146:  6.82300000E+00 s/b  6.823000e+00
Real147   1.21257168E+05 s/b  1.212572e+05
Real148:  9.42124497E-01 s/b  9.421146e-01
Real149: -1.57067710E+00 s/b -1.570677e+00
Real150:  4.17153925E-01 s/b  4.171539e-01
Real151: -33 s/b -33
Real152: -843 s/b -843
Real153: -6244 s/b -6244
Real154: -8.42200000E+01 s/b -8.422000e+01
Real155:  8.42200000E+01 s/b  8.422000e+01
Real156:  -4.33300000E+01 s/b -4.333000e+01
Real157:  8.42200000E+01 s/b  8.422000e+01

******************* sets ******************************

Set1:  10101010101010101010 s/b 10101010101010101010
Set2:  1101110001 s/b 1101110001
Set3:  0100010000 s/b 0100010000
Set4:  0100001000 s/b 0100001000
Set5:  FALSE s/b false
Set6:   TRUE s/b true
Set7:   TRUE s/b true
Set8:  FALSE s/b false
Set9:   TRUE s/b true
Set10:  TRUE s/b true
Set11: FALSE s/b false
Set12:  TRUE s/b true
Set13:  TRUE s/b true
Set14: FALSE s/b false
Set15: 0101010000 s/b 0101010000
Set16: a_c_e_g_i_k_m_o_q_s_ s/b a_c_e_g_i_k_m_o_q_s_
Set17: a_cd_fg___ s/b a_cd_fg___
Set18: a______h__ s/b a______h__
Set19: _b_______j s/b _b_______j
Set20: FALSE s/b false
Set21:  TRUE s/b true
Set22:  TRUE s/b true
Set23: FALSE s/b false
Set24:  TRUE s/b true
Set25:  TRUE s/b true
Set26: FALSE s/b false
Set27:  TRUE s/b true
Set28:  TRUE s/b true
Set29: FALSE s/b false
Set30: a___e_____ s/b a___e_____
Set31: 0101010101 s/b 0101010101
Set32: 1101110001 s/b 1101110001
Set33: 0100010000 s/b 0100010000
Set34: 0100001000 s/b 0100001000
Set35: FALSE s/b false
Set36:  TRUE s/b true
Set37:  TRUE s/b true
Set38: FALSE s/b false
Set39:  TRUE s/b true
Set40:  TRUE s/b true
Set41: FALSE s/b false
Set42:  TRUE s/b true
Set43:  TRUE s/b true
Set44: FALSE s/b false
Set45: 0110000000 s/b 0110000000
Set46: 01 s/b 01
Set47: 11 s/b 11
Set48: 10 s/b 10
Set49: 10 s/b 10
Set50: FALSE s/b false
Set51:  TRUE s/b true
Set52:  TRUE s/b true
Set53: FALSE s/b false
Set54:  TRUE s/b true
Set55:  TRUE s/b true
Set56: FALSE s/b false
Set57:  TRUE s/b true
Set58:  TRUE s/b true
Set59: FALSE s/b false
Set60: 11 s/b 11
set61:  TRUE s/b true

******************* Pointers ******************************

Pointer1:   4594 s/b 4594
Pointer2:    TRUE s/b  true
Pointer3:   FALSE s/b false
Pointer4:   p s/b p
Pointer5:   5 s/b 5
Pointer6:   3 s/b 3
Pointer7:   17 s/b 17
Pointer8:   1234.5678 s/b 1234.5678
Pointer9:   my word is s/b my word is
Pointer10:  20 19 18 17 16 15 14 13 12 11 s/b 20 19 18 17 16 15 14 13 12 11
Pointer11:   7234 y s/b 7234 y
Pointer12:   _b_d____ij s/b _b_d____ij
Pointer13:  3732 s/b 3732
Pointer14:   TRUE s/b  true
Pointer15:  FALSE s/b false
Pointer16:   TRUE s/b true
Pointer17:  FALSE s/b false
Pointer18:  FALSE s/b false
Pointer19:   TRUE s/b  true
Pointer20:  done s/b done
Pointer21:  Pointer22:  done s/b done
Pointer23:  done s/b done
Pointer24:  
  1   2   3   4   5   6   7   8   9  10 
 11  12  13  14  15  16  17  18  19  20 
 21  22  23  24  25  26  27  28  29  30 
 31  32  33  34  35  36  37  38  39  40 
 41  42  43  44  45  46  47  48  49  50 
 51  52  53  54  55  56  57  58  59  60 
 61  62  63  64  65  66  67  68  69  70 
 71  72  73  74  75  76  77  78  79  80 
 81  82  83  84  85  86  87  88  89  90 
 91  92  93  94  95  96  97  98  99 100 

s/b

  1   2   3   4   5   6   7   8   9  10
 11  12  13  14  15  16  17  18  19  20
 21  22  23  24  25  26  27  28  29  30
 31  32  33  34  35  36  37  38  39  40
 41  42  43  44  45  46  47  48  49  50
 51  52  53  54  55  56  57  58  59  60
 61  62  63  64  65  66  67  68  69  70
 71  72  73  74  75  76  77  78  79  80
 81  82  83  84  85  86  87  88  89  90
 91  92  93  94  95  96  97  98  99  100
Pointer25:  
  1   2   3   4   5   6   7   8   9  10 
 11  12  13  14  15  16  17  18  19  20 
 21  22  23  24  25  26  27  28  29  30 
 31  32  33  34  35  36  37  38  39  40 
 41  42  43  44  45  46  47  48  49  50 
 51  52  53  54  55  56  57  58  59  60 
 61  62  63  64  65  66  67  68  69  70 
 71  72  73  74  75  76  77  78  79  80 
 81  82  83  84  85  86  87  88  89  90 
 91  92  93  94  95  96  97  98  99 100 

s/b

  1   2   3   4   5   6   7   8   9  10
 11  12  13  14  15  16  17  18  19  20
 21  22  23  24  25  26  27  28  29  30
 31  32  33  34  35  36  37  38  39  40
 41  42  43  44  45  46  47  48  49  50
 51  52  53  54  55  56  57  58  59  60
 61  62  63  64  65  66  67  68  69  70
 71  72  73  74  75  76  77  78  79  80
 81  82  83  84  85  86  87  88  89  90
 91  92  93  94  95  96  97  98  99  100

******************* arrays ******************************

Array1:   20 19 18 17 16 15 14 13 12 11  s/b 20 19 18 17 16 15 14 13 12 11
Array2:   20 19 18 17 16 15 14 13 12 11  s/b 20 19 18 17 16 15 14 13 12 11
Array3:   20 19 18 17 16 15 14 13 12 11  s/b 20 19 18 17 16 15 14 13 12 11
Array4:   20 19 18 17 16 15 14 13 12 11  s/b 20 19 18 17 16 15 14 13 12 11
Array5:   FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE 
    s/b:   false  true false  true false  true false  true false  true
Array6:   FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE 
    s/b:   false  true false  true false  true false  true false  true
Array7:   20.12 19.12 18.12 17.12 16.12 15.12 14.12 13.12 12.12 11.12 
    s/b:   20.12 19.12 18.12 17.12 16.12 15.12 14.12 13.12 12.12 11.12
Array8:   20.12 19.12 18.12 17.12 16.12 15.12 14.12 13.12 12.12 11.12 
    s/b:   20.12 19.12 18.12 17.12 16.12 15.12 14.12 13.12 12.12 11.12
Array9:   k j i h g f e d c b s/b k j i h g f e d c b
Array10:  k j i h g f e d c b s/b k j i h g f e d c b
Array11:  p o n m l k j i h g s/b p o n m l k j i h g
Array12:  p o n m l k j i h g s/b p o n m l k j i h g
Array13:  9 8 7 6 5 4 3 2 1 0 s/b 9 8 7 6 5 4 3 2 1 0
Array14:  9 8 7 6 5 4 3 2 1 0 s/b 9 8 7 6 5 4 3 2 1 0
Array15:  5 4 3 2 s/b 5 4 3 2
Array16:  5 4 3 2 s/b 5 4 3 2
Array17:  k j i h g f e d c b s/b k j i h g f e d c b
Array18:  k j i h g f e d c b s/b k j i h g f e d c b
Array19:  20 k 19 j 18 i 17 h 16 g 15 f 14 e 13 d 12 c 11 b 
     s/b:  20 k 19 j 18 i 17 h 16 g 15 f 14 e 13 d 12 c 11 b
Array20:  20 k 19 j 18 i 17 h 16 g 15 f 14 e 13 d 12 c 11 b 
     s/b:  20 k 19 j 18 i 17 h 16 g 15 f 14 e 13 d 12 c 11 b
Array21:  20 19 18 17 16 15 14 13 12 11 s/b 20 19 18 17 16 15 14 13 12 11
Array22:  20 19 18 17 16 15 14 13 12 11 s/b 20 19 18 17 16 15 14 13 12 11
Array23:  20 19 18 17 16 15 14 13 12 11 s/b 20 19 18 17 16 15 14 13 12 11
Array24:  20 19 18 17 16 15 14 13 12 11 s/b 20 19 18 17 16 15 14 13 12 11
Array25:  11 10  s/b 11 10
Array26:  11 10  s/b 11 10
Array27:  j i h g f e d c b a  s/b  j i h g f e d c b a
Array28:  j i h g f e d c b a  s/b  j i h g f e d c b a
Array29:  j i h g f e d c b a  s/b  j i h g f e d c b a
Array30:  j i h g f e d c b a  s/b  j i h g f e d c b a
Array31:  9 8 7 6 5 4 3 2 1 0  s/b  9 8 7 6 5 4 3 2 1 0
Array32:  9 8 7 6 5 4 3 2 1 0  s/b  9 8 7 6 5 4 3 2 1 0
Array33:  5 4 3 2 1  s/b  5 4 3 2 1
Array34:  5 4 3 2 1  s/b  5 4 3 2 1
Array35:
 0 10 20 30 40 50 60 70 80 90 
 1 11 21 31 41 51 61 71 81 91 
 2 12 22 32 42 52 62 72 82 92 
 3 13 23 33 43 53 63 73 83 93 
 4 14 24 34 44 54 64 74 84 94 
 5 15 25 35 45 55 65 75 85 95 
 6 16 26 36 46 56 66 76 86 96 
 7 17 27 37 47 57 67 77 87 97 
 8 18 28 38 48 58 68 78 88 98 
 9 19 29 39 49 59 69 79 89 99 
s/b
0 10 20 30 40 50 60 70 80 90
1 11 21 31 41 51 61 71 81 91
2 12 22 32 42 52 62 72 82 92
3 13 23 33 43 53 63 73 83 93
4 14 24 34 44 54 64 74 84 94
5 15 25 35 45 55 65 75 85 95
6 16 26 36 46 56 66 76 86 96
7 17 27 37 47 57 67 77 87 97
8 18 28 38 48 58 68 78 88 98
9 19 29 39 49 59 69 79 89 99
Array36: 
63 62 61 60 59 58 57 56 
55 54 53 52 51 50 49 48 
47 46 45 44 43 42 41 40 
39 38 37 36 35 34 33 32 
31 30 29 28 27 26 25 24 
23 22 21 20 19 18 17 16 
15 14 13 12 11 10  9  8 
 7  6  5  4  3  2  1  0 
s/b:
63 62 61 60 59 58 57 56
55 54 53 52 51 50 49 48
47 46 45 44 43 42 41 40
39 38 37 36 35 34 33 32
31 30 29 28 27 26 25 24
23 22 21 20 19 18 17 16
15 14 13 12 11 10  9  8
 7  6  5  4  3  2  1  0
Array37: 
hello, guy s/b hello, guy
Array38: 
20 19 18 17 16 15 14 13 12 11 s/b 20 19 18 17 16 15 14 13 12 11
Array39: 
63 62 61 60 59 58 57 56 
55 54 53 52 51 50 49 48 
47 46 45 44 43 42 41 40 
39 38 37 36 35 34 33 32 
31 30 29 28 27 26 25 24 
23 22 21 20 19 18 17 16 
15 14 13 12 11 10  9  8 
 7  6  5  4  3  2  1  0 
s/b:
63 62 61 60 59 58 57 56
55 54 53 52 51 50 49 48
47 46 45 44 43 42 41 40
39 38 37 36 35 34 33 32
31 30 29 28 27 26 25 24
23 22 21 20 19 18 17 16
15 14 13 12 11 10  9  8
 7  6  5  4  3  2  1  0
Array40: 
20 19 18 17 16 15 14 13 12 11 s/b 20 19 18 17 16 15 14 13 12 11
Array41: 
30 29 28 27 26 25 24 23 22 21 s/b 30 29 28 27 26 25 24 23 22 21
Array42: 
40 39 38 37 36 35 34 33 32 31 s/b 40 39 38 37 36 35 34 33 32 31
Array43: 
22 21 20 19 18 17 16 15 14 13 s/b 22 21 20 19 18 17 16 15 14 13

******************* records ******************************

Record1:   
64 FALSE j 1 3 12  4.54512000E-29 what ? who
21 22 23 24 25 26 27 28 29 30 
2324 y
_bcde___i_
8454
s/b:
64 false j 1 3 12  4.54512000e-29 what ? who
21 22 23 24 25 26 27 28 29 30
2324 y
_bcde___i_
8454
Record2:   
64 FALSE j 1 3 12  4.54512000E-29 what ? who
21 22 23 24 25 26 27 28 29 30 
2324 y
_bcde___i_
8454
s/b:
64 false j 1 3 12  4.54512000e-29 what ? who
21 22 23 24 25 26 27 28 29 30
2324 y
_bcde___i_
8454
Record3:   873 0 235 427 s/b 873 0 235 427
Record4:   873 1  TRUE 427 s/b 873 1  true 427
Record5:   873 2 f 427 s/b 873 2 f 427
Record6:   873 3 8 427 s/b 873 3 8 427
Record7:   873 4 3 427 s/b 873 4 3 427
Record8:   873 5 12 427 s/b 873 5 12 427
Record9:   873 6 8734.8389 427 s/b 873 6 8734.8389 427
Record10:  873 7 this one ? 427 s/b 873 7 this one ? 427
Record11:  873 8 20 19 18 17 16 15 14 13 12 11 427
      s/b:  873 8 20 19 18 17 16 15 14 13 12 11 427
Record12:  873 9 2387 t 427 s/b:  873 9 2387 t 427
Record13:  873 10 _i_gfedcb_ 427
      s/b:  873 10 _i_gfedcb_ 427
Record14:  873 11 2394 427 s/b 873 11 2394 427
Record15:  10 2343 s/b 10 2343
Record16:  19  TRUE s/b 19  true
Record17:   TRUE 2343 s/b  true 2343
Record18:  FALSE  TRUE s/b false  true
Record19:  2 2343 s/b 2 2343
Record20:  7  TRUE s/b 7  true
Record21:  3 2343 s/b 3 2343
Record22:  4  TRUE s/b 4  true
Record23:  1 2 3 4 5 6 7 8 9 10 s/b 1 2 3 4 5 6 7 8 9 10
Record24:  10 9 8 7 6 5 4 3 2 1 s/b 10 9 8 7 6 5 4 3 2 1
Record25:  10 9 8 7 6 5 4 3 2 76 s/b 10 9 8 7 6 5 4 3 2 76
Record26:  1 g s/b 1 g
Record27:  20 19 18 17 16 15 14 13 12 11 s/b 20 19 18 17 16 15 14 13 12 11

******************* files ******************************

File1:   11 12 13 14 15 16 17 18 19 20 s/b 11 12 13 14 15 16 17 18 19 20
File2:   11 12 13 14 15 16 17 18 19 20 s/b 11 12 13 14 15 16 17 18 19 20
File3:    TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE 
   s/b:    true false  true false  true false  true false  true false
File4:    TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE 
   s/b:    true false  true false  true false  true false  true false
File5:   a b c d e f g h i j s/b a b c d e f g h i j
File6:   a b c d e f g h i j s/b a b c d e f g h i j
File7:   0 1 2 3 4 5 6 7 8 9 s/b 0 1 2 3 4 5 6 7 8 9
File8:   0 1 2 3 4 5 6 7 8 9 s/b 0 1 2 3 4 5 6 7 8 9
File9:
7384
8342
 TRUE
FALSE
m
q
 1.23456780E+00
1.2345678
 5.68943210E+01
0.93837632
hi there !
hi th
     hi there !
s/b:
7384
8342
 true
false
m
q
 1.2345678000e+00
1.2345678
 5.6894321000e+01
0.93837632
hi there !
hi th
     hi there !
file10:
7384
8342
m
q
 1.23456780E+00
 1.23456780E+00
 5.68943210E+01
 9.38376320E-01
s/b:
7384
8342
m
q
 1.2345678000e+00
 1.2345678000e+00
 5.6894321000e+01
 9.3837632000e+01
file11:
'how now<eoln>
brown cow<eoln>
' s/b 'how now<eoln> brown cow<eoln> '
file12:
'too much<eoln>
too soon' s/b 'too much<eoln> too soon<eoln> '
File13:   11 12 13 14 15 16 17 18 19 20 s/b 11 12 13 14 15 16 17 18 19 20
File14:   11 12 13 14 15 16 17 18 19 20 s/b 11 12 13 14 15 16 17 18 19 20
File15:    TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE 
   s/b:    true false  true false  true false  true false  true false
File16:    TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE 
   s/b:    true false  true false  true false  true false  true false
File17:   a b c d e f g h i j s/b a b c d e f g h i j
File18:   a b c d e f g h i j s/b a b c d e f g h i j
File19:   0 1 2 3 4 5 6 7 8 9 s/b 0 1 2 3 4 5 6 7 8 9
File20:   0 1 2 3 4 5 6 7 8 9 s/b 0 1 2 3 4 5 6 7 8 9
File21:    s/b 50
File22:   TRUE s/b true

************ Procedures and functions ******************

ProcedureFunction1:   45 89 s/b 45 89
ProcedureFunction2:   46 s/b 46
ProcedureFunction3:   total junk s/b total junk
ProcedureFunction4:   tota? junk s/b tota? junk
total junk s/b total junk
ProcedureFunction5:   35 s/b 35
ProcedureFunction6:   10 9 8 6 5 4 3 2 1 78
s/b:   10 9 8 6 5 4 3 2 1 78
ProcedureFunction7:
93  TRUE k 7 4 10  3.14140000E+00 hello, guy
11 12 13 14 15 16 17 18 19 20 
64 FALSE j 1 3 12  4.54512000E-29 what ? who
21 22 23 24 25 26 27 28 29 30 
2324 y
_bcde___i_
8454
23487 n FALSE
help me123
abcd___h__
734
s/b:
93  true k 7 4 10  3.14140000e+00 hello, guy
11 12 13 14 15 16 17 18 19 20
64 false j 1 3 12  4.54500000e-29 what ? who
21 22 23 24 25 26 27 28 29 30
2324 y
_bcde___i_
8454
23487 n false
help me123
abcd___h__
734
ProcedureFunction8:   9834 8383 j 744 s/b 9834 8383 j 744
ProcedureFunction9:   942 s/b 942
ProcedureFunction10:   62 76 s/b 62 76
ProcedureFunction11:   52 s/b 52
ProcedureFunction12:   a s/b a
ProcedureFunction13:   37 s/b 37
