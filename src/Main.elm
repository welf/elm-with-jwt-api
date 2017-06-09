module Main exposing (..)

import Html exposing (Html, blockquote, button, div, h2, p, program, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Http
import RemoteData exposing (WebData)


-- MODEL


type alias Model =
    { quote : WebData String }


initialModel : Model
initialModel =
    { quote = RemoteData.Loading }


init : ( Model, Cmd Msg )
init =
    ( initialModel, fetchRandomQuoteCmd )



-- UPDATE


type Msg
    = GetQuote
    | FetchRandomQuote (WebData String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetQuote ->
            model ! [ fetchRandomQuoteCmd ]

        FetchRandomQuote result ->
            { model | quote = result } ! []



-- COMMANDS


fetchRandomQuoteCmd : Cmd Msg
fetchRandomQuoteCmd =
    Http.getString randomQuoteUrl
        |> RemoteData.sendRequest
        |> Cmd.map FetchRandomQuote


randomQuoteUrl : String
randomQuoteUrl =
    api ++ "/api/random-quote"


api : String
api =
    "http://localhost:3001"



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h2 [ class "text-center" ] [ text "Chuck Norris Quotes" ]
        , p [ class "text-center" ]
            [ button
                [ class "btn btn-success"
                , onClick GetQuote
                ]
                [ text "Grab a quote" ]
            ]
        , blockquote []
            [ p [] [ viewQuote model.quote ]
            ]
        ]


viewQuote : WebData String -> Html Msg
viewQuote result =
    case result of
        RemoteData.NotAsked ->
            text "Quote was not asked"

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Failure error ->
            text "Something gone wrong... :("

        RemoteData.Success newQuote ->
            text newQuote



--MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
