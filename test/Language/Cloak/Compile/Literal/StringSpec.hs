module Language.Cloak.Compile.Literal.StringSpec (spec) where

import BasicTypes (SourceText (..))
import FastString (mkFastString)
import GHC (mkHsIsString)
import qualified Language.Cloak.Compile.Literal.String as String
import Language.Cloak.Compile.TestUtils
import qualified Language.Cloak.Syntax.Literal.String as String
import Test.Hspec

spec :: Spec
spec =
  describe "compilation of"
    . describe "string literals"
    . it "compiles strings into Haskell strings"
    $ do
      let value = "Hello world!"
      let input = String.StringNode undefined value
      let expectedOutput = mkHsIsString (SourceText value) (mkFastString value)
      String.compile input `shouldCompileTo` expectedOutput
