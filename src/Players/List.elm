module Players.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import RemoteData exposing (WebData)
import Msgs exposing (Msg)
import Models exposing (Player)


-- LIST VIEW


view : WebData (List Player) -> Html Msg
view response =
    let
        listView =
            maybeList response
    in
        Html.div [] [
          nav
          , listView
        ]


nav : Html Msg
nav =
    Html.div [Html.Attributes.attribute "class" "clearfix mb2 white bg-black"] [
      Html.div [Html.Attributes.attribute "class" "left p2"] [Html.text "Players"]
    ]


maybeList : WebData (List Player) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            Html.span [] []

        RemoteData.Loading ->
            Html.span [] [Html.text "Loading..."]

        RemoteData.Success players ->
            list players

        RemoteData.Failure error ->
            Html.span [] [Html.text (error |> toString)]


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
    Html.tr [] [
      Html.td [] [Html.text player.id]
      , Html.td [] [Html.text player.name]
      , Html.td [] [Html.text (player.level |> toString)]
      , Html.td [] []
    ]
