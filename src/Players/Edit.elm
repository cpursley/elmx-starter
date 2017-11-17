module Players.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Models exposing (Player)


view : Player -> Html Msg
view model =
    Html.div [] [
      nav model
      , form model
    ]


nav : Player -> Html Msg
nav model =
    Html.div [Html.Attributes.attribute "class" "clearfix mb2 white bg-black p1"] [
    ]


form : Player -> Html Msg
form player =
    Html.div [Html.Attributes.attribute "class" "m3"] [
      Html.h1 [] [Html.text player.name]
      , formLevel player
    ]


formLevel : Player -> Html Msg
formLevel player =
    Html.div [Html.Attributes.attribute "class" "clearfix py1"] [
      Html.div [Html.Attributes.attribute "class" "col col-5"] [
        Html.span [] [Html.text "Level"]
      ]
      , Html.div [Html.Attributes.attribute "class" "h2 bold"] [
        Html.text (player.level |> toString)
        , btnLevelDecrease player
        , btnLevelIncrease player
      ]
    ]


btnLevelDecrease : Player -> Html Msg
btnLevelDecrease player =
    let
        message =
            Msgs.ChangeLevel player -1
    in
        Html.a [Html.Attributes.attribute "class" "btn ml1 h1"] [
          Html.i [Html.Attributes.attribute "class" "fa fa-minus-circle", Html.Events.onClick (message)] []
        ]


btnLevelIncrease : Player -> Html Msg
btnLevelIncrease player =
    let
        message =
            Msgs.ChangeLevel player 1
    in
        Html.a [Html.Attributes.attribute "class" "btn ml1 h1"] [
          Html.i [Html.Attributes.attribute "class" "fa fa-plus-circle", Html.Events.onClick (message)] []
        ]
