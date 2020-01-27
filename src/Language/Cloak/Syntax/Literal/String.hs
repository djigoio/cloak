module Language.Cloak.Syntax.Literal.String
  ( Node (..),
  )
where

import Language.Cloak.Core

data Node
  = StringNode Position String
  deriving (Show, Eq)
