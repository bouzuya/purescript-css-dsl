module CSS.Property
  ( DisplayValue(..)
  , FontFamily(..)
  , FontFamilyValue
  , background
  , backgroundColor
  , border
  , borderTop
  , color
  , display
  , fontFamily
  , fontSize
  , fontStyle
  , fontWeight
  , lineHeight
  , listStyle
  , margin
  , marginBottom
  , marginLeft
  , marginRight
  , marginTop
  , textAlign
  , whiteSpace
  ) where

import CSS.Types (Property, TypedProperty, expr, property, typedProperty)
import Data.Foldable (intercalate)
import Prelude (class Show, map, show)

data DisplayValue
  = Block
  | Inline
  | ListItem
  | None
  | DisplayValue String

instance showDisplayValue :: Show DisplayValue where
  show Block = "block"
  show Inline = "inline"
  show ListItem = "list-item"
  show None = "none"
  show (DisplayValue s) = s

type FontFamilyValue = Array FontFamily

data FontFamily
  = FamilyName String
  -- GenericFamily
  | Serif
  | SansSerif
  | Cursive
  | Fantasy
  | Monospace

instance showFontFamily :: Show FontFamily where
  show (FamilyName s) = s
  show Serif = "serif"
  show SansSerif = "sans-serif"
  show Cursive = "cursive"
  show Fantasy = "fantasy"
  show Monospace = "monospace"

background :: Property
background = property "background"

backgroundColor :: Property
backgroundColor = property "background-color"

border :: Property
border = property "border"

borderTop :: Property
borderTop = property "border-top"

color :: Property
color = property "color"

display :: TypedProperty DisplayValue
display = typedProperty "display" (\v -> expr (show v))

fontFamily :: TypedProperty FontFamilyValue
fontFamily = typedProperty "font-family" (\v -> expr (intercalate ", " (map show v)))

fontSize :: Property
fontSize = property "font-size"

fontStyle :: Property
fontStyle = property "font-style"

fontWeight :: Property
fontWeight = property "font-weight"

lineHeight :: Property
lineHeight = property "line-height"

listStyle :: Property
listStyle = property "list-style"

margin :: Property
margin = property "margin"

marginBottom :: Property
marginBottom = property "margin-bottom"

marginLeft :: Property
marginLeft = property "margin-left"

marginRight :: Property
marginRight = property "margin-right"

marginTop :: Property
marginTop = property "margin-top"

textAlign :: Property
textAlign = property "text-align"

whiteSpace :: Property
whiteSpace = property "white-space"
