
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SqDist of expr* expr;;

let rec exprToString e =
  let ex = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((ex x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((ex x) ^ ")")
  | Average (x,y) -> "((" ^ ((ex x) ^ ("+" ^ ((ex y) ^ ")/2)")))
  | Times (x,y) -> (ex x) ^ ("*" ^ (ex y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((ex w) ^
           ("<" ^ ((ex x) ^ ("?" ^ ((ex y) ^ (":" ^ ((ex z) ^ ")")))))))
  | SqDist (x,y) ->
      "(" ^ ((ex x) ^ (")" ^ ("^2+" ^ ("(" ^ ((ex y ")") ^ "^2")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SqDist of expr* expr;;

let rec exprToString e =
  let ex = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((ex x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((ex x) ^ ")")
  | Average (x,y) -> "((" ^ ((ex x) ^ ("+" ^ ((ex y) ^ ")/2)")))
  | Times (x,y) -> (ex x) ^ ("*" ^ (ex y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((ex w) ^
           ("<" ^ ((ex x) ^ ("?" ^ ((ex y) ^ (":" ^ ((ex z) ^ ")")))))))
  | SqDist (x,y) ->
      "(" ^ ((ex x) ^ (")" ^ ("^2+" ^ ("(" ^ ((ex y) ^ (")" ^ "^2"))))));;

*)

(* changed spans
(26,46)-(26,56)
ex y
AppG (fromList [VarG])

(26,52)-(26,55)
")" ^ "^2"
AppG (fromList [LitG])

*)

(* changed exprs
App (Just (26,46)-(26,52)) (Var (Just (26,47)-(26,49)) "ex") [Var (Just (26,50)-(26,51)) "y"]
App (Just (26,55)-(26,67)) (Var (Just (26,60)-(26,61)) "^") [Lit (Just (26,56)-(26,59)) (LS ")"),Lit (Just (26,62)-(26,66)) (LS "^2")]
*)

(* typed spans
(26,46)-(26,52)
(26,55)-(26,67)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
