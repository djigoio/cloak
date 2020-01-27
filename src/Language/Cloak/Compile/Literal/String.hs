module Language.Cloak.Compile.Literal.String
  ( compile,
  )
where

import qualified BasicTypes as GHC
import qualified FastString as GHC
import qualified GHC
import qualified Language.Cloak.Syntax.Literal.String as String

compile :: String.Node -> GHC.HsOverLit GHC.GhcPs
compile literal =
  case literal of
    String.StringNode _ value ->
      GHC.mkHsIsString (GHC.SourceText value) (GHC.mkFastString value)
