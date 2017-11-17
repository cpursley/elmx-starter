module Msgs exposing (..)

import Http
import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Models exposing (Player)


-- MESSAGES


type Msg
    = OnFetchPlayers (WebData (List Player))
    | OnLocationChange Location
    | ChangeLevel Player Int
    | OnPlayerSave (Result Http.Error Player)
