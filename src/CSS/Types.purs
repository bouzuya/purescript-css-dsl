module CSS.Types
  ( (:=)
  , Declaration
  , Expr
  , Property
  , TypedProperty
  , RuleSet
  , Selector
  , StyleSheet
  , declaration
  , declaration_
  , expr
  , property
  , ruleSet
  , ruleSet_
  , selector
  , styleSheet
  , typedProperty
  ) where

import Data.Foldable (intercalate)
import Prelude (class Show, identity, map, show, (<>))

type Prio = Boolean

data Declaration = Declaration PropertyName Expr Prio
instance showDeclaration :: Show Declaration where
  show (Declaration p v i) =
    p <> ": " <> show v <> (if i then " !important" else "") <> ";"

newtype Expr = Expr String
instance showExpr :: Show Expr where
  show (Expr s) = s

type Property = TypedProperty Expr
type PropertyName = String

data TypedProperty value = TypedProperty PropertyName (value -> Expr)
instance showTypedProperty :: Show (TypedProperty a) where
  show (TypedProperty s _) = s

data RuleSet = RuleSet (Array Selector) (Array Declaration)
instance showRuleSet :: Show RuleSet where
  show (RuleSet ss d) =
    intercalate
      "\n"
      [ intercalate ", " (map show ss)
      , "{"
      , intercalate "\n" (map (\s -> "  " <> s) (map show d))
      , "}"
      ]

newtype Selector = Selector String
instance showSelector :: Show Selector where
  show (Selector s) = s

newtype StyleSheet = StyleSheet (Array RuleSet)
instance showStyleSheet :: Show StyleSheet where
  show (StyleSheet xs) = intercalate "\n" (map show xs)

declaration :: forall value. TypedProperty value -> value -> Prio -> Declaration
declaration (TypedProperty n f) v i = Declaration n (f v) i

declaration_ :: forall value. TypedProperty value -> value -> Declaration
declaration_ (TypedProperty n f) v = Declaration n (f v) false

infixl 6 declaration_ as :=

expr :: String -> Expr
expr = Expr

property :: String -> Property
property name = typedProperty name identity

styleSheet :: Array RuleSet -> StyleSheet
styleSheet = StyleSheet

selector :: String -> Selector
selector = Selector

ruleSet_ :: Selector -> Array Declaration -> RuleSet
ruleSet_ s ds = RuleSet [s] ds

ruleSet :: Array Selector -> Array Declaration -> RuleSet
ruleSet = RuleSet

typedProperty :: forall value. String -> (value -> Expr) -> TypedProperty value
typedProperty = TypedProperty
