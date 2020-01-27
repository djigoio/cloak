module Language.Cloak.Parse.Literal.NumberSpec (spec) where

import Language.Cloak.Core
import qualified Language.Cloak.Parse.Literal.Number as Number
import qualified Language.Cloak.Syntax.Literal.Number as Number
import Test.Hspec
import Test.Hspec.Megaparsec
import Text.Megaparsec (parse)

spec :: Spec
spec =
  describe "number literals" $ do
    it "should parse positive integers" $
      parse Number.parse "" "42" `shouldParse` Number.IntegerNode (Position 1 1) 42 "42"
    it "should parse negative numbers" $
      parse Number.parse "" "-42" `shouldParse` Number.IntegerNode (Position 1 1) (-42) "-42"
