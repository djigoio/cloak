-- | Defines all the required types to represent
-- the syntax of Cloak
module Language.Cloak.Syntax
  ( NumberLiteral (..),
  )
where

newtype NumberLiteral = IntegerLiteral Integer
  deriving (Show, Eq)
