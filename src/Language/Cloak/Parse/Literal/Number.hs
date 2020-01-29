-- | Parsing of number literals
module Language.Cloak.Parse.Literal.Number
  ( parse,
  )
where

import Language.Cloak.Core
import Language.Cloak.Parse.Core
import qualified Language.Cloak.Syntax.Literal.Number as Number

parse :: Parser Number.Node
parse = label "number literal" $ do
  pos <- getPosition
  try (signedDecimal pos)
    <|> signedInteger pos

signedInteger :: Position -> Parser Number.Node
signedInteger pos = do
  parsedValue <- signedNumber decimal
  pure (Number.IntegerNode pos parsedValue (show parsedValue))

signedDecimal :: Position -> Parser Number.Node
signedDecimal pos = do
  parsedValue <- signedNumber float
  pure (Number.FloatNode pos (toRational (parsedValue :: Double)) (show parsedValue))

signedNumber :: Num number => Parser number -> Parser number
signedNumber numParser =
  signed spaceConsumer (lex numParser)
