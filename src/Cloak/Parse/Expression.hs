module Cloak.Parse.Expression
  ( parse,
  )
where

import Cloak.Core
import Cloak.Parse.Core
import qualified Cloak.Parse.Expression.Literal as Literal
import qualified Cloak.Syntax.Expression as Expression

parse :: Parser Expression.Node
parse =
  label "expression" $ do
    pos <- getPosition
    try (list pos)
      <|> literal pos
  where
    list pos = do
      let comma = lex (void $ char ',')
      parsed <- parse `sepBy` comma
      endPos <- getPosition
      pure (Expression.ListNode (Span pos endPos) parsed)
    literal pos = do
      parsed <- Literal.parse
      endPos <- getPosition
      pure (Expression.LiteralNode (Span pos endPos) parsed)
