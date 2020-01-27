module Language.Cloak.Compile.Literal.Number
  ( compile,
  )
where

import qualified BasicTypes as GHC
import qualified GHC
import qualified Language.Cloak.Syntax.Literal.Number as Number

compile :: Number.Node -> GHC.HsOverLit GHC.GhcPs
compile literal =
  case literal of
    Number.IntegerNode _ value _ ->
      GHC.OverLit GHC.noExt (GHC.HsIntegral (GHC.mkIntegralLit value)) (GHC.XExpr GHC.noExt)
    Number.FloatNode _ value _ ->
      GHC.OverLit
        GHC.noExt
        (GHC.HsFractional (GHC.mkFractionalLit value))
        (GHC.XExpr GHC.noExt)
