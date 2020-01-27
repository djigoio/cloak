module Language.Cloak.Compile.Literal.StringSpec (spec) where

import qualified BasicTypes as GHC
import qualified FastString as GHC
import qualified GHC
import qualified Language.Cloak.Compile.Literal.String as String
import Language.Cloak.Compile.TestUtils
import qualified Language.Cloak.Syntax.Literal.String as String
import Test.Hspec

spec :: Spec
spec =
  describe "compilation of"
    . describe "number literals"
    . it "compiles strings into Haskell strings"
    $ do
      let value = "Hello world!"
      let input = String.StringNode undefined value
      let expectedOutput = GHC.mkHsIsString (GHC.SourceText value) (GHC.mkFastString value)
      String.compile input `shouldCompileTo` expectedOutput
