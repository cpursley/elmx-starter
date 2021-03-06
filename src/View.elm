module View exposing (..)

import Html exposing (Html, div, text)
import RemoteData
import Msgs exposing (Msg)
import Models exposing (Model, PlayerId)
import Players.List
import Players.Edit


-- MAIN VIEW


view : Model -> Html Msg
view model =
    Html.div [] [
      page model
    ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.PlayersRoute ->
            Players.List.view model.players

        Models.PlayerRoute id ->
            playerEditPage model id

        Models.NotFoundRoute ->
            notFoundView


playerEditPage : Model -> PlayerId -> Html Msg
playerEditPage model playerId =
    case model.players of
        RemoteData.NotAsked ->
            Html.span [] []

        RemoteData.Loading ->
            Html.span [] [Html.text "Loading ..."]

        RemoteData.Success players ->
            let
                maybePlayer =
                    players
                        |> List.filter (\player -> player.id == playerId)
                        |> List.head
            in
                case maybePlayer of
                    Just player ->
                        Players.Edit.view player

                    Nothing ->
                        notFoundView

        RemoteData.Failure error ->
            Html.span [] [Html.text (error |> toString)]


-- HELPERS


notFoundView : Html msg
notFoundView =
    Html.div [] [
      Html.span [] [Html.text "Not Found"]
    ]
