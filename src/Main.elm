module Main exposing (..)

import Html exposing (Html, blockquote, button, div, h2, p, program, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Http


-- MODEL


type alias Model =
    { quote : String }


initialModel : Model
initialModel =
    { quote = "A quote pls! " }


init : ( Model, Cmd Msg )
init =
    ( initialModel, fetchRandomQuoteCmd )



-- UPDATE


type Msg
    = GetQuote
    | FetchRandomQuote (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetQuote ->
            { model | quote = model.quote ++ "A quote! " } ! []

        FetchRandomQuote result ->
            case result of
                Err error ->
                    { model | quote = toString error } ! []

                Ok newQuote ->
                    { model | quote = newQuote } ! []



-- COMMANDS


fetchRandomQuoteCmd : Cmd Msg
fetchRandomQuoteCmd =
    Http.getString randomQuoteUrl
        |> Http.send FetchRandomQuote


randomQuoteUrl : String
randomQuoteUrl =
    api ++ "/api/random-quote"


api : String
api =
    "http://localhost:3001/"



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
            [ p [] [ text model.quote ] ]
        ]



--MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
