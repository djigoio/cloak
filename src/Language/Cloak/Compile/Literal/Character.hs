module Language.Cloak.Compile.Literal.Character
  ( compile,
  )
where

import BasicTypes (SourceText (..))
import GHC (GhcPs, HsLit (..))
import qualified Language.Cloak.Syntax.Literal.Character as Character

compile :: Character.Node -> HsLit GhcPs
compile literal =
  case literal of
    Character.CharNode _ value ->
      HsChar (SourceText $ show value) value
