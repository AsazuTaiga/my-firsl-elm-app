module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN
-- mainはElmでは特別な値
-- 画面に何を表示するかを記述する


main : Program () Model Msg
main =
    -- init : 初期化
    -- view : 画面表示
    -- update : ユーザーからの入力を渡す
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL
-- アプリケーションに関する情報を全てくまなくデータとして表現できるようにする


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE
-- 各種イベントで生成されたメッセージをきっかけとして、modelが各場面でどのように変化するかを記述する


type Msg
    = Increment
    | Decrement
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            if model == 0 then
                0

            else
                model
                    - 1

        Reset ->
            0



-- VIEW
-- modelの内容を表示する
-- modelを引数に取り、HTMLを出力する
-- イベントハンドラを紐づける（クリックすると、メッセージを生成する -> update関数に渡る）


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        , div [] []
        , button [ onClick Reset ] [ text "RESET" ]
        ]
