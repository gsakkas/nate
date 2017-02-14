
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
  | Sine e1 -> "sin(pi *" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi *" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ (exprToString e2 ")/2)")))
  | Times (e1,e2) ->
      "(" ^ ((exprToString e1) ^ ("*" ^ (exprToString e2 ")")))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;


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
  | Sine e1 -> "sin(pi *" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi *" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) ->
      "(" ^ ((exprToString e1) ^ ("*" ^ ((exprToString e2) ^ ")")))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(18,43)-(18,55)
(20,42)-(20,54)
(27,51)-(27,63)
(27,64)-(27,66)
*)

(* type error slice
(15,31)-(15,43)
(15,31)-(15,46)
(15,31)-(15,53)
(15,48)-(15,49)
(18,43)-(18,55)
(18,43)-(18,65)
(20,42)-(20,54)
(20,42)-(20,61)
*)