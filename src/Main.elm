module Main exposing (..)

import Html exposing (program)
import Msgs exposing (Msg)
import Commands exposing (fetchPlayers)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)


-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( initialModel, fetchPlayers )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
