module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)
import Models exposing (PlayerId, Route(..))


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map PlayersRoute top
        , map PlayerRoute (s "players" </> string)
        , map PlayersRoute (s "players")
        ]


parseLocation : Location -> Route
parseLocation location =
    let
        currentRoute =
            location |> parseHash matchers
    in
        case currentRoute of
            Just route ->
                route

            Nothing ->
                NotFoundRoute
