module Language.Cloak.Compile.Literal.CharacterSpec (spec) where

import BasicTypes (SourceText (..))
import GHC (HsLit (..))
import qualified Language.Cloak.Compile.Literal.Character as Character
import Language.Cloak.Compile.TestUtils
import qualified Language.Cloak.Syntax.Literal.Character as Character
import Test.Hspec

spec :: Spec
spec =
  describe "compilation of"
    . describe "character literals"
    . it "compiles chars into Haskell chars"
    $ do
      let input = Character.CharNode undefined 'a'
      let expectedOutput = HsChar (SourceText "'a'") 'a'
      Character.compile input `shouldCompileTo` expectedOutput
