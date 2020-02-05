module Cloak.Parse.Expression.Literal
  ( parse,
  )
where

import Cloak.Parse.Core
import qualified Cloak.Syntax.Expression.Literal as Literal

parse :: Parser Literal.Node
parse =
  label "literal" $
    try character
      <|> try floatNumber
      <|> try integerNumber
      <|> string

character :: Parser Literal.Node
character = label "character literal" . lex $ do
  void (char '\'')
  parsed <- charLiteral
  void (char '\'')
  pure (Literal.CharacterNode parsed)

string :: Parser Literal.Node
string = label "string literal" . lex $ do
  void (char '\"')
  parsed <- manyTill charLiteral (char '\"')
  pure (Literal.StringNode parsed)

integerNumber :: Parser Literal.Node
integerNumber = label "integer literal" . lex $ do
  parsed <- signedNumber decimal
  pure (Literal.IntegerNode parsed)

floatNumber :: Parser Literal.Node
floatNumber = label "floating point number literal" . lex $ do
  parsed <- signedNumber float
  pure (Literal.FloatNode parsed)


signedNumber :: Num number => Parser number -> Parser number
signedNumber numParser =
  signed spaceConsumer (lex numParser)