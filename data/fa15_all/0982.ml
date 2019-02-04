
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine s -> String.concat "" ["sin(pi*"; exprToString s; ")"]
  | Cosine s -> String.concat "" ["cos(pi*"; exprToString s; ")"]
  | Average (s,p) ->
      ((("((" + (exprToString s)) + "+") + (exprToString p)) + ")/2"
  | Times (s,p) -> ((exprToString s) + "*") + (exprToString p)
  | Thresh (s,p,r,d) ->
      ((((((("(" + (exprToString s)) + "<") + (exprToString p)) + "?") +
           (exprToString r))
          + ":")
         + (exprToString d))
        + ")"
  | _ -> 0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine s -> String.concat "" ["sin(pi*"; exprToString s; ")"]
  | Cosine s -> String.concat "" ["cos(pi*"; exprToString s; ")"]
  | Average (s,p) ->
      String.concat "" ["(("; exprToString s; "+"; exprToString p; ")/2"]
  | Times (s,p) -> String.concat "" [exprToString s; "*"; exprToString p]
  | Thresh (s,p,r,d) ->
      String.concat ""
        ["(";
        exprToString s;
        "<";
        exprToString p;
        "?";
        exprToString r;
        ":";
        exprToString d;
        ")"]
  | _ -> "";;

*)

(* changed spans
(18,6)-(18,60)
EMPTY
EmptyG

(18,6)-(18,68)
EMPTY
EmptyG

(18,7)-(18,40)
EMPTY
EmptyG

(18,8)-(18,33)
String.concat ""
              ["((" ; exprToString s ; "+" ; exprToString p ; ")/2"]
AppG (fromList [LitG,ListG EmptyG Nothing])

(18,9)-(18,13)
["((" ; exprToString s ; "+" ; exprToString p ; ")/2"]
ListG LitG Nothing

(19,19)-(19,43)
String.concat ""
              [exprToString s ; "*" ; exprToString p]
AppG (fromList [LitG,ListG EmptyG Nothing])

(19,19)-(19,62)
EMPTY
EmptyG

(19,20)-(19,36)
[exprToString s ; "*" ; exprToString p]
ListG LitG Nothing

(21,6)-(24,28)
EMPTY
EmptyG

(21,6)-(25,13)
EMPTY
EmptyG

(21,7)-(23,16)
EMPTY
EmptyG

(21,8)-(22,28)
EMPTY
EmptyG

(21,9)-(21,70)
EMPTY
EmptyG

(21,10)-(21,63)
EMPTY
EmptyG

(21,11)-(21,43)
EMPTY
EmptyG

(21,12)-(21,36)
String.concat ""
              ["(" ; exprToString s ; "<" ; exprToString p ; "?" ; exprToString r ; ":" ; exprToString d ; ")"]
AppG (fromList [LitG,ListG EmptyG Nothing])

(21,13)-(21,16)
["(" ; exprToString s ; "<" ; exprToString p ; "?" ; exprToString r ; ":" ; exprToString d ; ")"]
ListG LitG Nothing

(26,9)-(26,10)
""
LitG

*)
