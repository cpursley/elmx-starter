module Msgs exposing (..)

import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Models exposing (Player)


-- MESSAGES


type Msg
    = OnFetchPlayers (WebData (List Player))
    | OnLocationChange Location
