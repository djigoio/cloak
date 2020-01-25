module Main
  ( main,
  )
where

main :: IO ()
main =
  runSimpleApp (logInfo "Hello world")
