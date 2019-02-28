
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: ((prod / 10) + (mulByDigit i t))
      else (prod mod 10) :: t;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: (prod / 10) :: (mulByDigit i t)
      else (prod mod 10) :: t;;

*)

(* changed spans
(8,28)-(8,60)
(prod / 10) :: (mulByDigit i
                           t)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG VarG LitG])))

*)

(* changed exprs
ConApp (Just (8,28)-(8,59)) "::" (Just (Tuple (Just (8,28)-(8,59)) [Bop (Just (8,28)-(8,39)) Div (Var (Just (8,29)-(8,33)) "prod") (Lit (Just (8,36)-(8,38)) (LI 10)),App (Just (8,43)-(8,59)) (Var (Just (8,44)-(8,54)) "mulByDigit") [Var (Just (8,55)-(8,56)) "i",Var (Just (8,57)-(8,58)) "t"]])) Nothing
*)

(* typed spans
(8,28)-(8,59)
*)

(* correct types
int list
*)

(* bad types
int
*)
