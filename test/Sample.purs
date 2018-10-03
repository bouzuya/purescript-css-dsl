module Test.Main.Sample
  ( sample
  , sampleAsString
  ) where

import CSS (DisplayValue(..), FontFamily(..), StyleSheet, address, b, background, blockquote, body, border, borderTop, br, cite, code, color, dd, dir, display, div, dl, dt, em, expr, fontFamily, fontSize, fontStyle, fontWeight, form, h1, h2, h3, h4, h5, h6, hr, i, img, kbd, li, lineHeight, listStyle, margin, marginBottom, marginLeft, marginRight, marginTop, menu, ol, p, pre, ruleSet, ruleSet_, samp, selector, span, strong, styleSheet, textAlign, tt, ul, var, whiteSpace, (:=))
import Data.Foldable (intercalate)

-- https://www.w3.org/TR/CSS1/#appendix-a
sample :: StyleSheet
sample =
  styleSheet
    [ ruleSet_
        body
        [ margin := (expr "1em")
        , fontFamily := [Serif]
        , lineHeight := (expr "1.1")
        , background := (expr "white")
        , color := (expr "black")
        ]
    , ruleSet
        [ h1
        , h2
        , h3
        , h4
        , h5
        , h6
        , p
        , ul
        , ol
        , dir
        , menu
        , div
        , dt
        , dd
        , address
        , blockquote
        , pre
        , br
        , hr
        , form
        , dl
        ]
        [ display := Block
        ]
    , ruleSet
        [ b
        , strong
        , i
        , em
        , cite
        , var
        , tt
        , code
        , kbd
        , samp
        , img
        , span
        ]
        [ display := Inline
        ]
    , ruleSet_
        li
        [ display := ListItem
        ]
    , ruleSet
        [ h1
        , h2
        , h3
        , h4
        ]
        [ marginTop := (expr "1em")
        , marginBottom := (expr "1em")
        ]
    , ruleSet
        [ h5
        , h6
        ]
        [ marginTop := (expr "1em")
        ]
    , ruleSet_
        h1
        [ textAlign := (expr "center")
        ]
    , ruleSet
        [ h1
        , h2
        , h4
        , h6
        ]
        [ fontWeight := (expr "bold")
        ]
    , ruleSet
        [ h3
        , h5
        ]
        [ fontStyle := (expr "italic")
        ]
    , ruleSet_
        h1
        [ fontSize := (expr "xx-large")
        ]
    , ruleSet_
        h2
        [ fontSize := (expr "x-large")
        ]
    , ruleSet_
        h3
        [ fontSize := (expr "large")
        ]
    , ruleSet
        [ b
        , strong
        ]
        [ fontWeight := (expr "bolder")
        ]
    , ruleSet
        [ i
        , cite
        , em
        , var
        , address
        , blockquote
        ]
        [ fontStyle := (expr "italic")
        ]
    , ruleSet
        [ pre
        , tt
        , code
        , kbd
        , samp
        ]
        [ fontFamily := [Monospace]
        ]
    , ruleSet_
        pre
        [ whiteSpace := (expr "pre")
        ]
    , ruleSet_
        address
        [ marginLeft := (expr "3em")
        ]
    , ruleSet_
        blockquote
        [ marginLeft := (expr "3em")
        , marginRight := (expr "3em")
        ]
    , ruleSet
        [ ul
        , dir
        ]
        [ listStyle := (expr "disc")
        ]
    , ruleSet_
        ol
        [ listStyle := (expr "decimal")
        ]
    , ruleSet_
        menu
        [ margin := (expr "0")
        ]
    , ruleSet_
        li
        [ marginLeft := (expr "3em")
        ]
    , ruleSet_
        dt
        [ marginBottom := (expr "0")
        ]
    , ruleSet_
        dd
        [ marginTop := (expr "0")
        , marginLeft := (expr "3em")
        ]
    , ruleSet_
        hr
        [ borderTop := (expr "solid")
        ]
    , ruleSet_
        (selector "a:link")
        [ color := (expr "blue")
        ]
    , ruleSet_
        (selector "a:visited")
        [ color := (expr "red")
        ]
    , ruleSet_
        (selector "a:active")
        [ color := (expr "lime")
        ]
    , ruleSet_
        (selector "a:link img")
        [ border := (expr "2px solid blue")
        ]
    , ruleSet_
        (selector "a:visited img")
        [ border := (expr "2px solid red")
        ]
    , ruleSet_
        (selector "a:active img")
        [ border := (expr "2px solid lime")
        ]
    ]

sampleAsString :: String
sampleAsString =
  intercalate
    "\n"
    [ "body"
    , "{"
    , "  margin: 1em;"
    , "  font-family: serif;"
    , "  line-height: 1.1;"
    , "  background: white;"
    , "  color: black;"
    , "}"
    , "h1, h2, h3, h4, h5, h6, p, ul, ol, dir, menu, div, dt, dd, address, blockquote, pre, br, hr, form, dl"
    , "{"
    , "  display: block;"
    , "}"
    , "b, strong, i, em, cite, var, tt, code, kbd, samp, img, span"
    , "{"
    , "  display: inline;"
    , "}"
    , "li"
    , "{"
    , "  display: list-item;"
    , "}"
    , "h1, h2, h3, h4"
    , "{"
    , "  margin-top: 1em;"
    , "  margin-bottom: 1em;"
    , "}"
    , "h5, h6"
    , "{"
    , "  margin-top: 1em;"
    , "}"
    , "h1"
    , "{"
    , "  text-align: center;"
    , "}"
    , "h1, h2, h4, h6"
    , "{"
    , "  font-weight: bold;"
    , "}"
    , "h3, h5"
    , "{"
    , "  font-style: italic;"
    , "}"
    , "h1"
    , "{"
    , "  font-size: xx-large;"
    , "}"
    , "h2"
    , "{"
    , "  font-size: x-large;"
    , "}"
    , "h3"
    , "{"
    , "  font-size: large;"
    , "}"
    , "b, strong"
    , "{"
    , "  font-weight: bolder;"
    , "}"
    , "i, cite, em, var, address, blockquote"
    , "{"
    , "  font-style: italic;"
    , "}"
    , "pre, tt, code, kbd, samp"
    , "{"
    , "  font-family: monospace;"
    , "}"
    , "pre"
    , "{"
    , "  white-space: pre;"
    , "}"
    , "address"
    , "{"
    , "  margin-left: 3em;"
    , "}"
    , "blockquote"
    , "{"
    , "  margin-left: 3em;"
    , "  margin-right: 3em;"
    , "}"
    , "ul, dir"
    , "{"
    , "  list-style: disc;"
    , "}"
    , "ol"
    , "{"
    , "  list-style: decimal;"
    , "}"
    , "menu"
    , "{"
    , "  margin: 0;"
    , "}"
    , "li"
    , "{"
    , "  margin-left: 3em;"
    , "}"
    , "dt"
    , "{"
    , "  margin-bottom: 0;"
    , "}"
    , "dd"
    , "{"
    , "  margin-top: 0;"
    , "  margin-left: 3em;"
    , "}"
    , "hr"
    , "{"
    , "  border-top: solid;"
    , "}"
    , "a:link"
    , "{"
    , "  color: blue;"
    , "}"
    , "a:visited"
    , "{"
    , "  color: red;"
    , "}"
    , "a:active"
    , "{"
    , "  color: lime;"
    , "}"
    , "a:link img"
    , "{"
    , "  border: 2px solid blue;"
    , "}"
    , "a:visited img"
    , "{"
    , "  border: 2px solid red;"
    , "}"
    , "a:active img"
    , "{"
    , "  border: 2px solid lime;"
    , "}"
    ]
