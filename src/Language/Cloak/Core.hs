module Language.Cloak.Core
  ( Position (..),
  )
where

data Position
  = Position
      { line :: Int,
        column :: Int
      }
  deriving (Eq, Show)
