module Cloak.Compile.Expression.LiteralSpec (spec) where

import BasicTypes (SourceText (..), mkFractionalLit, mkIntegralLit)
import qualified Cloak.Compile.Expression.Literal as Literal
import qualified Cloak.Syntax.Expression.Literal as Literal
import Cloak.Test
import FastString (mkFastString)
import GHC (HsExpr (..), HsLit (..), mkHsFractional, mkHsIntegral, mkHsIsString, noExt)
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range

spec :: Spec
spec =
  describe "compilation of"
    . describe "literals"
    $ do
      it "compiles char literals" . requireProperty $ do
        value <- forAll Gen.unicode
        let input = Literal.CharacterNode value
        let expectedOutput = HsLit noExt (HsChar (SourceText $ show value) value)
        Literal.compile input `shouldCompileTo` expectedOutput
      it "compiles integers into Haskell integers" . requireProperty $ do
        value <- forAll $ Gen.integral (Range.constantBounded :: Range Int)
        let input = Literal.IntegerNode (fromIntegral value)
        let expectedOutput = HsOverLit noExt (mkHsIntegral (mkIntegralLit value))
        Literal.compile input `shouldCompileTo` expectedOutput
      it "compiles floats into Haskell floats" . requireProperty $ do
        value <- forAll $ Gen.realFloat (Range.exponentialFloat (-9999999999 :: Double) (9999999999 :: Double))
        let input = Literal.FloatNode value
        let expectedOutput = HsOverLit noExt (mkHsFractional (mkFractionalLit value))
        Literal.compile input `shouldCompileTo` expectedOutput
      it "compiles strings into Haskell strings" . requireProperty $ do
        value <- forAll (Gen.string (Range.linear 0 10000) Gen.unicode)
        let input = Literal.StringNode value
        let expectedOutput = HsOverLit noExt (mkHsIsString (SourceText value) (mkFastString value))
        Literal.compile input `shouldCompileTo` expectedOutput
