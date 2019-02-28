
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Square of expr
  | Hoi of expr* expr* expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let exp = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exp a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exp a) ^ ")")
  | Square a -> ("(" ^ ((exp a) ^ ("*" ^ ((exp a) ^ ")")))) "/2"
  | Average (a,b) -> "((" ^ ((exp a) ^ ("+" ^ ((exp b) ^ ")/2)")))
  | Times (a,b) -> (exp a) ^ ("*" ^ (exp b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exp a) ^
           ("<" ^ ((exp b) ^ ("?" ^ ((exp c) ^ (":" ^ ((exp d) ^ ")")))))))
  | Hoi (a,b,c) ->
      "sin(pi*" ^
        ((exp a) ^ (")*cos(pi*" ^ ((exp b) ^ (")/(" ^ ((exp c) ^ ")")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Square of expr
  | Hoi of expr* expr* expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let exp = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exp a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exp a) ^ ")")
  | Square a -> "((" ^ ((exp a) ^ ("*" ^ ((exp a) ^ ")/2)")))
  | Average (a,b) -> "((" ^ ((exp a) ^ ("+" ^ ((exp b) ^ ")/2)")))
  | Times (a,b) -> (exp a) ^ ("*" ^ (exp b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exp a) ^
           ("<" ^ ((exp b) ^ ("?" ^ ((exp c) ^ (":" ^ ((exp d) ^ ")")))))))
  | Hoi (a,b,c) ->
      "sin(pi*" ^
        ((exp a) ^ (")*cos(pi*" ^ ((exp b) ^ (")/(" ^ ((exp c) ^ ")")))));;

*)

(* changed spans
(20,16)-(20,64)
"((" ^ (exp a ^ ("*" ^ (exp a ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (20,16)-(20,61)) (Var (Just (20,21)-(20,22)) "^") [Lit (Just (20,16)-(20,20)) (LS "(("),App (Just (20,23)-(20,61)) (Var (Just (20,32)-(20,33)) "^") [App (Just (20,24)-(20,31)) (Var (Just (20,25)-(20,28)) "exp") [Var (Just (20,29)-(20,30)) "a"],App (Just (20,34)-(20,60)) (Var (Just (20,39)-(20,40)) "^") [Lit (Just (20,35)-(20,38)) (LS "*"),App (Just (20,41)-(20,59)) (Var (Just (20,50)-(20,51)) "^") [App (Just (20,42)-(20,49)) (Var (Just (20,43)-(20,46)) "exp") [Var (Just (20,47)-(20,48)) "a"],Lit (Just (20,52)-(20,58)) (LS ")/2)")]]]]
*)

(* typed spans
(20,16)-(20,61)
*)

(* correct types
string
*)

(* bad types
string
*)
