module Cloak.Compile.Expression
  ( compile,
  )
where

import Cloak.Compile.Core
import qualified Cloak.Compile.Expression.Literal as Literal
import qualified Cloak.Syntax.Expression as Expression
import GHC (GenLocated (..), GhcPs, HsExpr (..), LHsExpr, noExt)

compile :: Expression.Node -> LHsExpr GhcPs
compile expression =
  case expression of
    Expression.LiteralNode span node ->
      L (spanToGHC span) (Literal.compile node)
    Expression.ListNode span nodes ->
      L (spanToGHC span) (ExplicitList noExt Nothing (fmap compile nodes))
