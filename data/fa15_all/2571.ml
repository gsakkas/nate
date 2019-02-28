
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Mix of expr* expr* expr;;

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
  | Square ex -> "(" ^ ((exprToString ex) ^ ") ^ 2")
  | Mix (ex1,ex2,ex3) ->
      exprToString Average ((Times (ex1, ex2)), (Times (ex2, ex3)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Mix of expr* expr* expr;;

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
  | Square ex -> "(" ^ ((exprToString ex) ^ ") ^ 2")
  | Mix (ex1,ex2,ex3) ->
      exprToString (Average ((Times (ex1, ex2)), (Times (ex2, ex3))));;

*)

(* changed spans
(31,6)-(31,67)
exprToString (Average (Times (ex1 , ex2) , Times (ex2 , ex3)))
AppG (fromList [ConAppG (Just (TupleG (fromList [ConAppG (Just (TupleG (fromList [VarG])))])))])

*)

(* changed exprs
App (Just (31,6)-(31,69)) (Var (Just (31,6)-(31,18)) "exprToString") [ConApp (Just (31,19)-(31,69)) "Average" (Just (Tuple (Just (31,28)-(31,68)) [ConApp (Just (31,29)-(31,47)) "Times" (Just (Tuple (Just (31,36)-(31,46)) [Var (Just (31,37)-(31,40)) "ex1",Var (Just (31,42)-(31,45)) "ex2"])) Nothing,ConApp (Just (31,49)-(31,67)) "Times" (Just (Tuple (Just (31,56)-(31,66)) [Var (Just (31,57)-(31,60)) "ex2",Var (Just (31,62)-(31,65)) "ex3"])) Nothing])) Nothing]
*)

(* typed spans
(31,6)-(31,69)
*)

(* correct types
string
*)

(* bad types
string
*)
