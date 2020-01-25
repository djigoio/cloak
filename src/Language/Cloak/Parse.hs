-- | Functions that convert 'Text' into the Cloak syntax
-- representation, defined in 'Language.Cloak.Syntax'
module Language.Cloak.Parse
  ( numberLiteral,
  )
where

import Language.Cloak.Syntax
import Text.Megaparsec (Parsec)
import Text.Megaparsec.Char.Lexer

-- | Used to configure the megaparsec library.
-- We specify 'Void' as the first parameter for
-- 'Parsec' to say that we don't provide any custom
-- error type.
type Parser result = Parsec Void Text result

numberLiteral :: Parser NumberLiteral
numberLiteral = do
  parsedInteger <- decimal
  pure (IntegerLiteral parsedInteger)
