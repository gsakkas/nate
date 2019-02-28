
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let ex = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine t -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine t -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "(" ^ ((exprToString ex1) ^ ("*" ^ ((exprToString ex2) ^ ")/2")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;


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
  let ex = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine t -> "sin(pi*" ^ ((ex t) ^ ")")
  | Cosine t -> "cos(pi*" ^ ((ex t) ^ ")")
  | Average (ex1,ex2) -> "(" ^ ((ex ex1) ^ ("*" ^ ((ex ex2) ^ ")/2")))
  | Times (ex1,ex2) -> (ex ex1) ^ ("*" ^ (ex ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((ex ex1) ^
           ("<" ^ ((ex ex2) ^ ("?" ^ ((ex ex3) ^ (":" ^ ((ex ex4) ^ ")")))))));;

*)

(* changed spans
(16,41)-(16,43)
t
VarG

(17,30)-(17,42)
t
VarG

(19,14)-(19,26)
ex
VarG

(19,43)-(19,55)
ex
VarG

(20,24)-(20,36)
ex
VarG

(20,52)-(20,64)
ex
VarG

(23,10)-(23,22)
ex
VarG

(25,16)-(25,28)
ex
VarG

(27,22)-(27,34)
ex
VarG

(27,51)-(27,63)
ex
VarG

*)

(* changed exprs
Var (Just (16,31)-(16,32)) "t"
Var (Just (17,33)-(17,34)) "t"
Var (Just (18,33)-(18,35)) "ex"
Var (Just (18,52)-(18,54)) "ex"
Var (Just (19,24)-(19,26)) "ex"
Var (Just (19,42)-(19,44)) "ex"
Var (Just (22,10)-(22,12)) "ex"
Var (Just (23,20)-(23,22)) "ex"
Var (Just (23,39)-(23,41)) "ex"
Var (Just (23,58)-(23,60)) "ex"
*)

(* typed spans
(16,31)-(16,32)
(17,33)-(17,34)
(18,33)-(18,35)
(18,52)-(18,54)
(19,24)-(19,26)
(19,42)-(19,44)
(22,10)-(22,12)
(23,20)-(23,22)
(23,39)-(23,41)
(23,58)-(23,60)
*)

(* correct types
expr
expr
expr -> string
expr -> string
expr -> string
expr -> string
expr -> string
expr -> string
expr -> string
expr -> string
*)

(* bad types
expr -> string
expr -> string
expr -> string
expr -> string
expr -> string
expr -> string
expr -> string
expr -> string
expr -> string
expr -> string
*)
