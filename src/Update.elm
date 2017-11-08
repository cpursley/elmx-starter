module Update exposing (..)

import Msgs exposing (Msg)
import Routing exposing (parseLocation)
import Models exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchPlayers response ->
            ( { model | players = response }, Cmd.none )

        Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )
