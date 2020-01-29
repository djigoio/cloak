module Language.Cloak.Syntax.Literal.Character
  ( Node (..),
  )
where

import Language.Cloak.Core

data Node
  = CharNode Position Char
  deriving (Show, Eq)
