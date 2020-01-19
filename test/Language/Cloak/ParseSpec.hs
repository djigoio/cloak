module Language.Cloak.ParseSpec (spec) where

import Language.Cloak.Parse
import Language.Cloak.Syntax
import Test.Hspec
import Test.Hspec.Megaparsec
import Text.Megaparsec

spec :: Spec
spec =
  describe "parsing of"
    $ describe "number literals"
    $ it "should parse positive integers"
    $ parse numberLiteral "" "42" `shouldParse` IntegerLiteral 42
