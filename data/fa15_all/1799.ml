
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr
  | Three of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))))
  | SinCos ex ->
      "sin(pi*" ^
        ((exprToString ex) ^ (")*cos(pi*" ^ ((exprToString ex) ^ ")")))
  | Three (ex1,ex2,ex3) ->
      (exprToString ex1) ^
        ("*cos(pi*" ^
           ((exprToString ex2) ^ (")*sin(pi*" ^ (exprToString ex3 ")"))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr
  | Three of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))))
  | SinCos ex ->
      "sin(pi*" ^
        ((exprToString ex) ^ (")*cos(pi*" ^ ((exprToString ex) ^ ")")))
  | Three (ex1,ex2,ex3) ->
      (exprToString ex1) ^
        ("*cos(pi*" ^
           ((exprToString ex2) ^ (")*sin(pi*" ^ ((exprToString ex3) ^ ")"))));;

*)

(* changed spans
(35,49)-(35,61)
(^)
VarG

(35,49)-(35,61)
exprToString ex3
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (35,68)-(35,69)) "^"
App (Just (35,49)-(35,67)) (Var (Just (35,50)-(35,62)) "exprToString") [Var (Just (35,63)-(35,66)) "ex3"]
*)

(* typed spans
(35,68)-(35,69)
(35,49)-(35,67)
*)

(* correct types
string -> string -> string
string
*)

(* bad types
expr -> string
expr -> string
*)
