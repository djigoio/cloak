module Language.Cloak.Compile.Literal.Number
  ( compile,
  )
where

import BasicTypes (mkFractionalLit, mkIntegralLit)
import GHC (GhcPs, HsOverLit, mkHsFractional, mkHsIntegral)
import qualified Language.Cloak.Syntax.Literal.Number as Number

compile :: Number.Node -> HsOverLit GhcPs
compile literal =
  case literal of
    Number.IntegerNode _ value _ ->
      mkHsIntegral (mkIntegralLit value)
    Number.FloatNode _ value _ ->
      mkHsFractional (mkFractionalLit value)
