-- | Parsing of number literals
module Language.Cloak.Parse.Literal.Number
  ( parse,
  )
where

import Language.Cloak.Parse.Core
import qualified Language.Cloak.Syntax.Literal.Number as Number

parse :: Parser Number.Node
parse = do
  pos <- getPosition
  parsedValue <- signedInteger
  pure (Number.IntegerNode pos parsedValue)

signedInteger :: Parser Integer
signedInteger =
  signed spaceConsumer (lex decimal)
