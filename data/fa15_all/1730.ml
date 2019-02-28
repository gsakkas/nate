
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
  | Sine e' -> "sin (pi * " ^ ((exprToString e') ^ ")")
  | Cosine e' -> "cos (pi * " ^ ((exprToString e') ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ (" + " ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ (" * " ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^ (a ^ ("< " ^ (b ^ (" ? " ^ (c ^ (" : " ^ (d ^ ")")))))));;


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
  | Sine e' -> "sin (pi * " ^ ((exprToString e') ^ ")")
  | Cosine e' -> "cos (pi * " ^ ((exprToString e') ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ (" + " ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ (" * " ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("< " ^
              ((exprToString b) ^
                 (" ? " ^
                    ((exprToString c) ^ (" : " ^ ((exprToString d) ^ ")")))))));;

*)

(* changed spans
(21,13)-(21,14)
exprToString a
AppG (fromList [VarG])

(21,26)-(21,27)
exprToString b
AppG (fromList [VarG])

(21,40)-(21,41)
exprToString c
AppG (fromList [VarG])

(21,54)-(21,55)
exprToString d
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (22,9)-(22,25)) (Var (Just (22,10)-(22,22)) "exprToString") [Var (Just (22,23)-(22,24)) "a"]
App (Just (24,15)-(24,31)) (Var (Just (24,16)-(24,28)) "exprToString") [Var (Just (24,29)-(24,30)) "b"]
App (Just (26,21)-(26,37)) (Var (Just (26,22)-(26,34)) "exprToString") [Var (Just (26,35)-(26,36)) "c"]
App (Just (26,50)-(26,66)) (Var (Just (26,51)-(26,63)) "exprToString") [Var (Just (26,64)-(26,65)) "d"]
*)

(* typed spans
(22,9)-(22,25)
(24,15)-(24,31)
(26,21)-(26,37)
(26,50)-(26,66)
*)

(* correct types
string
string
string
string
*)

(* bad types
expr
expr
expr
expr
*)
