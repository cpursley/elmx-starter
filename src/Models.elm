module Models exposing (..)


type alias Model =
    { players : List Player
    }


initialModel : Model
initialModel =
    { players =
        [ Player "1" "Sam" 9
        , Player "2" "Geoff" 14
        ]
    }


type alias PlayerId =
    String


type alias Player =
    { id : PlayerId
    , name : String
    , level : Int
    }
