module Language.Cloak.Compile.TestUtils
  ( shouldCompileTo,
  )
where

import Outputable (Outputable (..), ppr, showSDocUnsafe)
import Test.Hspec

shouldCompileTo :: Outputable a => a -> a -> Expectation
shouldCompileTo a b =
  unsafeShow a `shouldBe` unsafeShow b
  where
    unsafeShow = showSDocUnsafe . ppr
