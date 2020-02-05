module Cloak.Compile.Core
  ( spanToGHC,
  )
where

import FastString (mkFastString)
import GHC (SrcSpan (..), mkSrcLoc, mkSrcSpan)
import Cloak.Core
import qualified Cloak.Error as Error

spanToGHC :: Span -> SrcSpan
spanToGHC span@Span {..} =
  if filename start /= filename end
    then error (Error.spanConversion span)
    else mkSrcSpan (toSrcLoc start) (toSrcLoc end)
  where
    toSrcLoc Position {..} =
      mkSrcLoc (mkFastString filename) line column
