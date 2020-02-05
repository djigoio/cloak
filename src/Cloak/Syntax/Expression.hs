module Cloak.Syntax.Expression
  ( Node (..),
  )
where

import Cloak.Core
import qualified Cloak.Syntax.Expression.Literal as Literal

data Node
  = ListNode Span [Node]
  | LiteralNode Span Literal.Node
  deriving (Show, Eq)
