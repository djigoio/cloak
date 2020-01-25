module Language.Cloak.Syntax.Literal.Number
  ( Node (..),
  )
where

import Language.Cloak.Core

data Node = IntegerNode Position Integer
  deriving (Show, Eq)
