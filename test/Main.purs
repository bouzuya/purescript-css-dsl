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
    Assert.equal sampleAsString (show sample)
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
        Assert.equal "background-color: red !important;" (show d1)
        Assert.equal "font-size: 10px;" (show d2)
    test "Show Property" do
        Assert.equal "background-color" (show p1)
    test "Show RuleSet" do
        Assert.equal
          (intercalate
            "\n"
            [ "html, h1"
            , "{"
            , "  background-color: red !important;"
            , "  font-size: 10px;"
            , "}"
            ])
          (show r1)
    test "Show Selector" do
        Assert.equal "html" (show s1)
    test "Show StyleSheet" do
        Assert.equal
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
          (show css1)
  test "selectors" do
    Assert.equal "h1" (show h1)
    Assert.equal "h2" (show h2)
    Assert.equal "h3" (show h3)
    Assert.equal "h4" (show h4)
    Assert.equal "h5" (show h5)
    Assert.equal "h6" (show h6)
  test "properties" do
    Assert.equal "background-color" (show backgroundColor)
    Assert.equal "display" (show display)
    Assert.equal "font-size" (show fontSize)
    Assert.equal "margin" (show margin)
