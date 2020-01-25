module Language.Cloak.Parse.Comment
  ( parse,
  )
where

import Language.Cloak.Core
import Language.Cloak.Parse.Core
import qualified Language.Cloak.Syntax.Comment as Comment

parse :: Parser Comment.Node
parse = do
  pos <- getPosition
  try (doc pos)
    <|> try (multiLine pos)
    <|> singleLine pos

doc :: Position -> Parser Comment.Node
doc pos = do
  docCommentStart
  parsedValue <- lex (manyTill charLiteral multiLineCommentEnd)
  pure (Comment.Doc pos $ pack parsedValue)

multiLine :: Position -> Parser Comment.Node
multiLine pos = do
  multiLineCommentStart
  parsedValue <- lex (manyTill charLiteral multiLineCommentEnd)
  pure (Comment.MultiLine pos $ pack parsedValue)

singleLine :: Position -> Parser Comment.Node
singleLine pos = do
  lex $ do
    void $ char '/'
    void $ char '/'
  let commentEnd = void eol <|> eof
  parsedValue <- lex (manyTill charLiteral commentEnd)
  pure (Comment.SingleLine pos $ pack parsedValue)

docCommentStart :: Parser ()
docCommentStart = lex $ do
  void $ char '/'
  void $ char '*'
  void $ char '*'

multiLineCommentStart :: Parser ()
multiLineCommentStart = lex $ do
  void $ char '/'
  void $ char '*'

multiLineCommentEnd :: Parser ()
multiLineCommentEnd = lex $ do
  void $ char '*'
  void $ char '/'
