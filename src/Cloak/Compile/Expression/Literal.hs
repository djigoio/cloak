module Cloak.Compile.Expression.Literal
  ( compile,
  )
where

import FastString (mkFastString)
import BasicTypes (SourceText(..), mkIntegralLit, mkFractionalLit)
import GHC (GhcPs, HsExpr (..), HsLit(..), noExt, mkHsIntegral, mkHsFractional, mkHsIsString)
import qualified Cloak.Syntax.Expression.Literal as Literal

compile :: Literal.Node -> HsExpr GhcPs
compile literal =
  case literal of
    Literal.CharacterNode value ->
      HsLit noExt (HsChar (SourceText $ show value) value)
    Literal.IntegerNode integerValue ->
      HsOverLit noExt (mkHsIntegral (mkIntegralLit integerValue))
    Literal.FloatNode floatValue ->
      HsOverLit noExt (mkHsFractional (mkFractionalLit floatValue))
    Literal.StringNode value ->
      HsOverLit noExt (mkHsIsString (SourceText value) (mkFastString value))
