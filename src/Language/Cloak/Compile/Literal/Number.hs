module Language.Cloak.Compile.Literal.Number
  ( compile,
  )
where

import qualified Language.Cloak.Syntax.Literal.Number as Number
import qualified Language.Haskell.Exts.Syntax as Haskell

compile :: Number.Node -> Haskell.Literal ()
compile literal =
  case literal of
    Number.IntegerNode _ value ->
      Haskell.Int () value (show value)
