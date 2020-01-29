module Language.Cloak.Parse.Literal.Character
  ( parse,
  )
where

import Language.Cloak.Parse.Core
import qualified Language.Cloak.Syntax.Literal.Character as Character

parse :: Parser Character.Node
parse = label "character literal" $ do
  pos <- getPosition
  parsedValue <- lex character
  pure (Character.CharNode pos parsedValue)
  where
    character = do
      void (char '\'')
      parsedChar <- charLiteral
      void (char '\'')
      pure parsedChar
