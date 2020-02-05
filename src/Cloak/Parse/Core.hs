module Cloak.Parse.Core
  ( Parser,
    module Exported,
    getPosition,
    spaceConsumer,
    lex,
    char,
    manyTill,
    pack,
    eof,
    eol,
    try,
    label,
    sepBy,
  )
where

import Cloak.Core
import RIO.Text (pack)
import Text.Megaparsec (Parsec, SourcePos (..), eof, getSourcePos, label, manyTill, sepBy, try, unPos)
import Text.Megaparsec.Char (char, eol, space1)
import Text.Megaparsec.Char.Lexer as Exported hiding (lexeme)
import qualified Text.Megaparsec.Char.Lexer as L

-- | Used to configure the megaparsec library.
-- We specify 'Void' as the first parameter for
-- 'Parsec' to say that we don't provide any custom
-- error type.
type Parser result = Parsec Void Text result

getPosition :: Parser Position
getPosition = do
  SourcePos {..} <- getSourcePos
  pure (Position (unPos sourceLine) (unPos sourceColumn) sourceName)

spaceConsumer :: Parser ()
spaceConsumer =
  space
    space1
    (skipLineComment "//")
    (skipBlockCommentNested "/*" "*/")

lex :: Parser a -> Parser a
lex = L.lexeme spaceConsumer
