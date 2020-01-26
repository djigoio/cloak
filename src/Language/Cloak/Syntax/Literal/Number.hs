module Language.Cloak.Syntax.Literal.Number
  ( Node (..),
  )
where

import Language.Cloak.Core

data Node
  = IntegerNode Position Integer String
  | FloatNode Position Rational String
  deriving (Show, Eq)
