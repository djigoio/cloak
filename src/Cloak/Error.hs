{-# LANGUAGE QuasiQuotes #-}
module Cloak.Error
  ( spanConversion,
  )
where

import Cloak.Core

repo :: String
repo = "https://github.com/cloak-lang/cloak"

spanConversion :: Span -> String
spanConversion Span{..} =
  [i|⚠ An internal error occurred:

  While trying to compile your code, my parser parsed
  your code correctly, but for some reason, it thinks that
  the position

  * (Line: #{line start}, Column: #{column start}) is in file #{filename start}

  while the position

  * (Line: #{line end}, Column: #{column end}) is in file #{filename end}

  This is impossible, as the parser parses one file at a time.

  Congratulations! You've found a bug 🐛 in the compiler!

  Please submit a ticket to #{repo}/issues 🙏
  |]
