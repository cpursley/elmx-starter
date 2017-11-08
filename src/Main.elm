module Main exposing (..)

import Navigation exposing (Location)
import Commands exposing (fetchPlayers)
import Msgs exposing (Msg)
import Routing
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)


-- MAIN


main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, fetchPlayers )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
