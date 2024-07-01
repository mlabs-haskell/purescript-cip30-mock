module Cardano.Wallet.Cip30Mock
  ( injectCip30Mock
  , Cip30Mock
  ) where

import Prelude

import Control.Promise (Promise)
import Data.Function.Uncurried (Fn2)
import Effect (Effect)

type Cip30Mock =
  { getNetworkId :: Effect (Promise Int)
  -- we ignore both the amount parameter and pagination:
  , getUtxos :: Effect (Promise (Array String))
  -- we ignore the amount parameter:
  , getCollateral :: Effect (Promise (Array String))
  , getBalance :: Effect (Promise String)
  -- we ignore pagination parameter:
  , getUsedAddresses :: Effect (Promise (Array String))
  , getUnusedAddresses :: Effect (Promise (Array String))
  , getChangeAddress :: Effect (Promise String)
  , getRewardAddresses :: Effect (Promise (Array String))
  -- we ignore the 'isPartial' parameter
  , signTx :: String -> Promise String
  , signData ::
      Fn2 String String (Promise { key :: String, signature :: String })
  }

-- returns an action that removes the mock.
foreign import injectCip30Mock :: String -> Cip30Mock -> Effect (Effect Unit)
