module Language.Cloak.Compile.Literal.NumberSpec (spec) where

import BasicTypes (mkFractionalLit, mkIntegralLit)
import GHC (mkHsFractional, mkHsIntegral)
import qualified Language.Cloak.Compile.Literal.Number as Number
import Language.Cloak.Compile.TestUtils
import qualified Language.Cloak.Syntax.Literal.Number as Number
import Test.Hspec

spec :: Spec
spec =
  describe "compilation of"
    . describe "number literals"
    $ do
      it "compiles positive integers into Haskell integers" $ do
        let value = 42 :: Integer
        let input = Number.IntegerNode undefined value (show value)
        let expectedOutput = mkHsIntegral (mkIntegralLit value)
        Number.compile input `shouldCompileTo` expectedOutput
      it "compiles positive floats into Haskell floats" $ do
        let value = 4.2 :: Rational
        let input = Number.FloatNode undefined value (show value)
        let expectedOutput = mkHsFractional (mkFractionalLit value)
        Number.compile input `shouldCompileTo` expectedOutput
