module Language.Cloak.Compile.Literal.NumberSpec (spec) where

import qualified Language.Cloak.Compile.Literal.Number as Number
import qualified Language.Cloak.Syntax.Literal.Number as Number
import qualified Language.Haskell.Exts.Syntax as Haskell
import Test.Hspec

spec :: Spec
spec =
  describe "compilation of"
    . describe "literals"
    . describe "number literals"
    . it "compiles positive integers into Haskell integers"
    $ do
      let input = Number.IntegerNode undefined 42
      let expectedOutput = Haskell.Int () 42 "42"
      Number.compile input `shouldBe` expectedOutput
