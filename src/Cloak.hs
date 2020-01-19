module Cloak
  ( runApp,
  )
where

runApp :: IO ()
runApp =
  runSimpleApp (logInfo "hey")
