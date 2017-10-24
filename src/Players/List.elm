module Players.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Models exposing (Player)



-- LIST VIEW


view : List Player -> Html Msg
view players =
    Html.div [] [
      nav
      , list players
    ]


nav : Html Msg
nav =
    Html.div [Html.Attributes.attribute "class" "clearfix mb2 white bg-black"] [
      Html.div [Html.Attributes.attribute "class" "left p2"] [Html.text "Players"]
    ]


list : List Player -> Html Msg
list players =
    let
        tableData =
            players |> List.map playerRow
    in
        Html.div [Html.Attributes.attribute "class" "p2"] [
          Html.table [] [
            Html.thead [] [
              Html.tr [] [
                Html.th [] [Html.text "Id"]
                , Html.th [] [Html.text "Name"]
                , Html.th [] [Html.text "Level"]
                , Html.th [] [Html.text "Actions"]
              ]
            ]
            , Html.tbody [] (
              tableData
            )
          ]
        ]


playerRow : Player -> Html Msg
playerRow player =
    let
        playerLevel =
            player.level |> toString
    in
        Html.tr [] [
          Html.td [] [text player.id]
          , Html.td [] [text player.name]
          , Html.td [] [text playerLevel]
          , Html.td [] []
        ]
