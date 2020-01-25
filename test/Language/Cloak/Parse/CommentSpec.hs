module Language.Cloak.Parse.CommentSpec (spec) where

import Language.Cloak.Core
import qualified Language.Cloak.Parse.Comment as Comment
import qualified Language.Cloak.Syntax.Comment as Comment
import Test.Hspec
import Test.Hspec.Megaparsec
import Text.Megaparsec (parse)

spec :: Spec
spec =
  describe "comments" $ do
    it "should parse single line comments" $
      parse Comment.parse "" "// This is a comment" `shouldParse` Comment.SingleLine (Position 1 1) "This is a comment"
    it "should parse single line comments without spaces" $
      parse Comment.parse "" "//This is a comment" `shouldParse` Comment.SingleLine (Position 1 1) "This is a comment"
    it "should parse multi line comments without lines" $
      parse Comment.parse "" "/*This is a comment*/" `shouldParse` Comment.MultiLine (Position 1 1) "This is a comment"
    it "should parse multi line comments with lines" $
      parse Comment.parse "" "/*This is a\nvery\nlong\n comment*/" `shouldParse` Comment.MultiLine (Position 1 1) "This is a\nvery\nlong\n comment"
    it "should parse doc comments without lines" $
      parse Comment.parse "" "/**This is a comment*/" `shouldParse` Comment.Doc (Position 1 1) "This is a comment"
    it "should parse doc comments with lines" $
      parse Comment.parse "" "/**This is a\nvery\nlong\n comment*/" `shouldParse` Comment.Doc (Position 1 1) "This is a\nvery\nlong\n comment"
