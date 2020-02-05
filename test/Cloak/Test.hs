module Cloak.Test
  ( module Reexported,
    shouldParse,
    shouldCompileTo,
  )
where

import Cloak.Core as Reexported
import HaskellWorks.Hspec.Hedgehog as Reexported (requireProperty)
import Hedgehog as Reexported
import Outputable (Outputable (..), ppr, showSDocUnsafe)
import Test.Hspec as Reexported
import qualified Test.Hspec.Megaparsec as THM
import Text.Megaparsec (Parsec, parse)
import Text.Megaparsec.Error (ShowErrorComponent)

-- | Asserts that (parser, input) parses the expected result
--
-- Usage
-- @
-- (Number.parse, "3" `shouldParse` Number.node 3)
-- @
shouldParse ::
  forall m a e.
  Eq a =>
  Show a =>
  ShowErrorComponent e =>
  MonadIO m =>
  (Parsec e Text a, Text) ->
  a ->
  m ()
shouldParse (parser, input) b = liftIO (parse parser "TEST SUITE" input `THM.shouldParse` b)

shouldCompileTo :: MonadIO m => Outputable a => a -> a -> m ()
shouldCompileTo a b =
  liftIO (unsafeShow a `shouldBe` unsafeShow b)
  where
    unsafeShow = showSDocUnsafe . ppr
