module Language.Cloak.Compile.Literal.NumberSpec (spec) where

import qualified BasicTypes as GHC
import qualified GHC
import qualified Language.Cloak.Compile.Literal.Number as Number
import qualified Language.Cloak.Syntax.Literal.Number as Number
import qualified Outputable as GHC
import Test.Hspec

spec :: Spec
spec =
  describe "compilation of"
    . describe "number literals"
    $ do
      it "compiles positive integers into Haskell integers" $ do
        let input = Number.IntegerNode undefined 42 "42"
        let expectedOutput = GHC.OverLit GHC.noExt (GHC.HsIntegral (GHC.mkIntegralLit (42 :: Int))) (GHC.XExpr GHC.noExt)
        Number.compile input `shouldCompileTo` expectedOutput
      it "compiles positive floats into Haskell floats" $ do
        let input = Number.FloatNode undefined 4.2 "4.2"
        let expectedOutput =
              GHC.OverLit
                GHC.noExt
                (GHC.HsFractional (GHC.mkFractionalLit (4.2 :: Double)))
                (GHC.XExpr GHC.noExt)
        Number.compile input `shouldCompileTo` expectedOutput

shouldCompileTo :: GHC.Outputable a => a -> a -> Expectation
shouldCompileTo a b =
  unsafeShow a `shouldBe` unsafeShow b
  where
    unsafeShow = GHC.showSDocUnsafe . GHC.ppr
