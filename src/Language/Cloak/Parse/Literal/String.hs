module Language.Cloak.Parse.Literal.String
  ( parse,
  )
where

import Language.Cloak.Parse.Core
import qualified Language.Cloak.Syntax.Literal.String as String

parse :: Parser String.Node
parse = do
  pos <- getPosition
  parsedValue <- lex string
  pure (String.StringNode pos parsedValue)
  where
    string = do
      void $ char '\"'
      manyTill charLiteral (char '\"')
