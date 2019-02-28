
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with | VarX  -> x | Sine m -> sin (pi *. (eval m)) | _ -> x;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with | VarX  -> x | Sine m -> sin (pi *. (eval (m, x, y))) | _ -> x;;

*)

(* changed spans
(14,57)-(14,58)
(m , x , y)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (14,57)-(14,66)) [Var (Just (14,58)-(14,59)) "m",Var (Just (14,61)-(14,62)) "x",Var (Just (14,64)-(14,65)) "y"]
*)

(* typed spans
(14,57)-(14,66)
*)

(* correct types
(expr * float * 'a)
*)

(* bad types
expr
*)
