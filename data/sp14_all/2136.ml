
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
  | Sine s -> "sin(pi*" ^ (s ^ ")");;


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
  | Sine s -> "sin(pi*" ^ ((Format.sprintf "%expr" 1.0) ^ ")");;

*)

(* changed spans
(15,27)-(15,28)
Format.sprintf "%expr" 1.0
AppG (fromList [LitG])

*)

(* changed exprs
App (Just (15,27)-(15,55)) (Var (Just (15,28)-(15,42)) "Format.sprintf") [Lit (Just (15,43)-(15,50)) (LS "%expr"),Lit (Just (15,51)-(15,54)) (LD 1.0)]
*)

(* typed spans
(15,27)-(15,55)
*)

(* correct types
*)

(* bad types
expr
*)
