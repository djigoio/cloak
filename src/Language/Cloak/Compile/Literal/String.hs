module Language.Cloak.Compile.Literal.String
  ( compile,
  )
where

import BasicTypes (SourceText (..))
import FastString (mkFastString)
import GHC (GhcPs, HsOverLit, mkHsIsString)
import qualified Language.Cloak.Syntax.Literal.String as String

compile :: String.Node -> HsOverLit GhcPs
compile literal =
  case literal of
    String.StringNode _ value ->
      mkHsIsString (SourceText value) (mkFastString value)
