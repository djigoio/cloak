module Language.Cloak.Syntax.Comment
  ( Node (..),
  )
where

import Language.Cloak.Core

data Node
  = SingleLine Position Text
  | MultiLine Position Text
  | Doc Position Text
  deriving (Show, Eq)
