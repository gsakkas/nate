
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let remainder = n mod 10 in
      if n = 0 then [remainder] else ((digitsOfInt n) / 10) @ [remainder];;


(* fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let remainder = n mod 10 in
      if n = 0 then [remainder] else (digitsOfInt (n / 10)) @ [remainder];;

*)

(* changed spans
(7,37)-(7,59)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (7,37)-(7,59)) (Var (Just (7,38)-(7,49)) "digitsOfInt") [Bop (Just (7,50)-(7,58)) Div (Var (Just (7,51)-(7,52)) "n") (Lit (Just (7,55)-(7,57)) (LI 10))]
*)

(* typed spans
(7,37)-(7,59)
*)

(* correct types
int list
*)

(* bad types
int
*)
