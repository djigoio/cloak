module Language.Cloak.Parse.Literal.CharacterSpec (spec) where

import Language.Cloak.Core
import qualified Language.Cloak.Parse.Literal.Character as Character
import qualified Language.Cloak.Syntax.Literal.Character as Character
import Test.Hspec
import Test.Hspec.Megaparsec
import Text.Megaparsec (parse)

spec :: Spec
spec =
  describe "character literals" $ do
    it "should parse chars" $
      parse Character.parse "" "'a'"
        `shouldParse` Character.CharNode (Position 1 1) 'a'
    it "should parse escaped chars" $
      parse Character.parse "" "'\n'"
        `shouldParse` Character.CharNode (Position 1 1) '\n'
