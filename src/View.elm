module View exposing (..)

import Html exposing (Html, div, text)
import Msgs exposing (Msg)
import Models exposing (Model)
import Players.List


-- MAIN VIEW


view : Model -> Html Msg
view model =
    Html.div [] [
      page model
    ]



-- HELPERS


page : Model -> Html Msg
page model =
    Players.List.view model.players
