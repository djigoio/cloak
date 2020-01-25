module Language.Cloak.Compile
  ( compile,
  )
where

compile :: IO ()
compile =
  runSimpleApp (logInfo "Hello world")
