
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

let rec exprToString e =
  let expr = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((expr a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((expr a) ^ ")")
  | Average (a,b) -> "((" ^ ((expr a) ^ ("+" ^ ((expr b) ^ ")/2)")))
  | Times (a,b) -> (expr a) ^ ("*" ^ (expr b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((expr a) ^
           ("<" ^ ((expr b) ^ ("?" ^ ((expr c) ^ (":" ^ ((expr d) ^ ")")))))))
  | Poly (a,b,c) ->
      "(" ^
        ((expr a) ^
           ("*" ^ ((expr a) ^ ("+" ^ ((expr b) ^ ("*" ^ ((expr c) ^ ")")))))))
  | Tan a -> "sin(pi*" ^ ((expr a) ^ (")/cos(pi*" ^ ((expr a) ")")));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

let rec exprToString e =
  let expr = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((expr a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((expr a) ^ ")")
  | Average (a,b) -> "((" ^ ((expr a) ^ ("+" ^ ((expr b) ^ ")/2)")))
  | Times (a,b) -> (expr a) ^ ("*" ^ (expr b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((expr a) ^
           ("<" ^ ((expr b) ^ ("?" ^ ((expr c) ^ (":" ^ ((expr d) ^ ")")))))))
  | Poly (a,b,c) ->
      "(" ^
        ((expr a) ^
           ("*" ^ ((expr a) ^ ("+" ^ ((expr b) ^ ("*" ^ ((expr c) ^ ")")))))))
  | Tan a -> "sin(pi*" ^ ((expr a) ^ (")/cos(pi*" ^ ((expr a) ^ ")")));;

*)

(* changed spans
(30,52)-(30,66)
expr a ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (30,52)-(30,68)) (Var (Just (30,62)-(30,63)) "^") [App (Just (30,53)-(30,61)) (Var (Just (30,54)-(30,58)) "expr") [Var (Just (30,59)-(30,60)) "a"],Lit (Just (30,64)-(30,67)) (LS ")")]
*)

(* typed spans
(30,52)-(30,68)
*)

(* correct types
string
*)

(* bad types
string
*)
