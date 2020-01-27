module Language.Cloak.Parse.Literal.StringSpec (spec) where

import Language.Cloak.Core
import qualified Language.Cloak.Parse.Literal.String as String
import qualified Language.Cloak.Syntax.Literal.String as String
import Test.Hspec
import Test.Hspec.Megaparsec
import Text.Megaparsec (parse)

spec :: Spec
spec =
  describe "string literals"
    . it "should parse strings"
    $ do
      let value = "Hello world!" :: String
      parse String.parse "" (fromString $ show value)
        `shouldParse` String.StringNode (Position 1 1) value
