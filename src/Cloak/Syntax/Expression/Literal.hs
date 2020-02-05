module Cloak.Syntax.Expression.Literal
  ( Node (..),
  )
where

data Node
  = CharacterNode Char
  | IntegerNode Integer
  | FloatNode Double
  | StringNode String
  deriving (Show, Eq)
