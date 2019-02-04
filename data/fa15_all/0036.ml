
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
EMPTY
EmptyG

(7,51)-(7,52)
n / 10
BopG VarG LitG

*)
