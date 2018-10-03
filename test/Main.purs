module Test.Main (main) where

import CSS (backgroundColor, declaration, display, expr, fontSize, h1, h2, h3, h4, h5, h6, margin, property, ruleSet, selector, styleSheet)
import CSS.Types (declaration_)
import Data.Foldable (intercalate)
import Effect (Effect)
import Prelude (Unit, discard, show)
import Test.Main.Sample (sample, sampleAsString)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  test "sample" do
    Assert.equal (show sample) sampleAsString
  suite "Show *" do
    let
      p1 = property "background-color"
      p2 = property "font-size"
      d1 = declaration p1 (expr "red") true
      d2 = declaration_ p2 (expr "10px")
      s1 = selector "html"
      s2 = selector "h1"
      r1 = ruleSet [s1, s2] [d1, d2]
      r2 = ruleSet [s1] [d1]
      css1 = styleSheet [r1, r2]
    test "Show Declaration" do
        Assert.equal (show d1) "background-color: red !important;"
        Assert.equal (show d2) "font-size: 10px;"
    test "Show Property" do
        Assert.equal (show p1) "background-color"
    test "Show RuleSet" do
        Assert.equal
          (show r1)
          (intercalate
            "\n"
            [ "html, h1"
            , "{"
            , "  background-color: red !important;"
            , "  font-size: 10px;"
            , "}"
            ])
    test "Show Selector" do
        Assert.equal (show s1) "html"
    test "Show StyleSheet" do
        Assert.equal
          (show css1)
          (intercalate
            "\n"
            [ "html, h1"
            , "{"
            , "  background-color: red !important;"
            , "  font-size: 10px;"
            , "}"
            , "html"
            , "{"
            , "  background-color: red !important;"
            , "}"
            ])
  test "selectors" do
    Assert.equal (show h1) "h1"
    Assert.equal (show h2) "h2"
    Assert.equal (show h3) "h3"
    Assert.equal (show h4) "h4"
    Assert.equal (show h5) "h5"
    Assert.equal (show h6) "h6"
  test "properties" do
    Assert.equal (show backgroundColor) "background-color"
    Assert.equal (show display) "display"
    Assert.equal (show fontSize) "font-size"
    Assert.equal (show margin) "margin"
