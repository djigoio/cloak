module Cloak.Parse.Expression.LiteralSpec
  ( spec,
  )
where

import qualified Cloak.Parse.Expression.Literal as Literal
import qualified Cloak.Syntax.Expression.Literal as Literal
import Cloak.Test
import qualified Hedgehog.Range as Range
import qualified Hedgehog.Gen as Gen

spec :: Spec
spec =
  describe "literals" $ do
    it "should parse char literals" . requireProperty $ do
      char <- forAll Gen.unicode
      (Literal.parse, fromString $ show char)
        `shouldParse` Literal.CharacterNode char
    it "should parse integer literals" . requireProperty $ do
        number <- forAll $ Gen.integral (Range.constantBounded :: Range Int)
        (Literal.parse, fromString $ show number)
          `shouldParse` Literal.IntegerNode (fromIntegral number)
    it "should parse floating point literals" . requireProperty $ do
        number <- forAll $ Gen.double (Range.exponentialFloat (-9999999999) (9999999999 :: Double))
        (Literal.parse, fromString $ show number)
          `shouldParse` Literal.FloatNode number
    it "should parse string literals" . requireProperty $ do
        value <- forAll $ Gen.string (Range.linear 0 1000) Gen.unicode
        (Literal.parse, fromString $ show value)
          `shouldParse` Literal.StringNode value