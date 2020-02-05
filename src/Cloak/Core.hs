module Cloak.Core
  ( Position (..),
    Span (..),
  )
where

data Span
  = Span
      { start :: Position,
        end :: Position
      }
  deriving (Eq, Show)

data Position
  = Position
      { line :: Int,
        column :: Int,
        filename :: String
      }
  deriving (Eq, Show)
