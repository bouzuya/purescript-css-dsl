module CSS.Selector
  ( address
  , b
  , blockquote
  , body
  , br
  , cite
  , code
  , dd
  , dir
  , div
  , dl
  , dt
  , em
  , form
  , h1
  , h2
  , h3
  , h4
  , h5
  , h6
  , hr
  , i
  , img
  , kbd
  , li
  , menu
  , ol
  , p
  , pre
  , samp
  , span
  , strong
  , tt
  , ul
  , var
  ) where

import CSS.Types (Selector, selector)

address :: Selector
address = selector "address"

b :: Selector
b = selector "b"

blockquote :: Selector
blockquote = selector "blockquote"

body :: Selector
body = selector "body"

br :: Selector
br = selector "br"

cite :: Selector
cite = selector "cite"

code :: Selector
code = selector "code"

dd :: Selector
dd = selector "dd"

dir :: Selector
dir = selector "dir"

div :: Selector
div = selector "div"

dl :: Selector
dl = selector "dl"

dt :: Selector
dt = selector "dt"

em :: Selector
em = selector "em"

form :: Selector
form = selector "form"

h1 :: Selector
h1 = selector "h1"

h2 :: Selector
h2 = selector "h2"

h3 :: Selector
h3 = selector "h3"

h4 :: Selector
h4 = selector "h4"

h5 :: Selector
h5 = selector "h5"

h6 :: Selector
h6 = selector "h6"

hr :: Selector
hr = selector "hr"

i :: Selector
i = selector "i"

img :: Selector
img = selector "img"

kbd :: Selector
kbd = selector "kbd"

li :: Selector
li = selector "li"

menu :: Selector
menu = selector "menu"

ol :: Selector
ol = selector "ol"

p :: Selector
p = selector "p"

pre :: Selector
pre = selector "pre"

samp :: Selector
samp = selector "samp"

span :: Selector
span = selector "span"

strong :: Selector
strong = selector "strong"

tt :: Selector
tt = selector "tt"

ul :: Selector
ul = selector "ul"

var :: Selector
var = selector "var"
