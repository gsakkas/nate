
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
  | Sine s -> String.concat ("sin(pi*", (exprToString s))
  | Cosine s -> ("cos(pi*" + (exprToString s)) + ")"
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
(15,14)-(15,57)
String.concat ""
              ["sin(pi*" ; exprToString s ; ")"]
AppG (fromList [LitG,ListG EmptyG])

(16,17)-(16,26)
String.concat ""
              ["cos(pi*" ; exprToString s ; ")"]
AppG (fromList [LitG,ListG EmptyG])

(18,6)-(18,68)
String.concat ""
              ["((" ; exprToString s ; "+" ; exprToString p ; ")/2"]
AppG (fromList [LitG,ListG EmptyG])

(19,19)-(19,62)
String.concat ""
              [exprToString s ; "*" ; exprToString p]
AppG (fromList [LitG,ListG EmptyG])

(21,6)-(25,13)
String.concat ""
              ["(" ; exprToString s ; "<" ; exprToString p ; "?" ; exprToString r ; ":" ; exprToString d ; ")"]
AppG (fromList [LitG,ListG EmptyG])

(26,9)-(26,10)
""
LitG

*)

(* changed exprs
App (Just (15,14)-(15,63)) (Var (Just (15,14)-(15,27)) "String.concat") [Lit (Just (15,28)-(15,30)) (LS ""),List (Just (15,31)-(15,63)) [Lit (Just (15,32)-(15,41)) (LS "sin(pi*"),App (Just (15,43)-(15,57)) (Var (Just (15,43)-(15,55)) "exprToString") [Var (Just (15,56)-(15,57)) "s"],Lit (Just (15,59)-(15,62)) (LS ")")] Nothing]
App (Just (16,16)-(16,65)) (Var (Just (16,16)-(16,29)) "String.concat") [Lit (Just (16,30)-(16,32)) (LS ""),List (Just (16,33)-(16,65)) [Lit (Just (16,34)-(16,43)) (LS "cos(pi*"),App (Just (16,45)-(16,59)) (Var (Just (16,45)-(16,57)) "exprToString") [Var (Just (16,58)-(16,59)) "s"],Lit (Just (16,61)-(16,64)) (LS ")")] Nothing]
App (Just (18,6)-(18,73)) (Var (Just (18,6)-(18,19)) "String.concat") [Lit (Just (18,20)-(18,22)) (LS ""),List (Just (18,23)-(18,73)) [Lit (Just (18,24)-(18,28)) (LS "(("),App (Just (18,30)-(18,44)) (Var (Just (18,30)-(18,42)) "exprToString") [Var (Just (18,43)-(18,44)) "s"],Lit (Just (18,46)-(18,49)) (LS "+"),App (Just (18,51)-(18,65)) (Var (Just (18,51)-(18,63)) "exprToString") [Var (Just (18,64)-(18,65)) "p"],Lit (Just (18,67)-(18,72)) (LS ")/2")] Nothing]
App (Just (19,19)-(19,73)) (Var (Just (19,19)-(19,32)) "String.concat") [Lit (Just (19,33)-(19,35)) (LS ""),List (Just (19,36)-(19,73)) [App (Just (19,37)-(19,51)) (Var (Just (19,37)-(19,49)) "exprToString") [Var (Just (19,50)-(19,51)) "s"],Lit (Just (19,53)-(19,56)) (LS "*"),App (Just (19,58)-(19,72)) (Var (Just (19,58)-(19,70)) "exprToString") [Var (Just (19,71)-(19,72)) "p"]] Nothing]
App (Just (21,6)-(30,12)) (Var (Just (21,6)-(21,19)) "String.concat") [Lit (Just (21,20)-(21,22)) (LS ""),List (Just (22,8)-(30,12)) [Lit (Just (22,9)-(22,12)) (LS "("),App (Just (23,8)-(23,22)) (Var (Just (23,8)-(23,20)) "exprToString") [Var (Just (23,21)-(23,22)) "s"],Lit (Just (24,8)-(24,11)) (LS "<"),App (Just (25,8)-(25,22)) (Var (Just (25,8)-(25,20)) "exprToString") [Var (Just (25,21)-(25,22)) "p"],Lit (Just (26,8)-(26,11)) (LS "?"),App (Just (27,8)-(27,22)) (Var (Just (27,8)-(27,20)) "exprToString") [Var (Just (27,21)-(27,22)) "r"],Lit (Just (28,8)-(28,11)) (LS ":"),App (Just (29,8)-(29,22)) (Var (Just (29,8)-(29,20)) "exprToString") [Var (Just (29,21)-(29,22)) "d"],Lit (Just (30,8)-(30,11)) (LS ")")] Nothing]
Lit (Just (31,9)-(31,11)) (LS "")
*)

(* typed spans
(15,14)-(15,63)
(16,16)-(16,65)
(18,6)-(18,73)
(19,19)-(19,73)
(21,6)-(30,12)
(31,9)-(31,11)
*)

(* correct types
string
string
string
string
string
string
*)

(* bad types
string
string
int
int
int
int
*)
