
let rec digitsOfInt n =
  let ns = [] in match n with | n -> (List.hd (n mod 10)) :: ns;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | n -> digitsOfInt (n - (List.hd ((n mod 10) :: ns)));;

*)

(* changed spans
(3,37)-(3,63)
EMPTY
EmptyG

(3,38)-(3,45)
n - List.hd ((n mod 10) :: ns)
BopG VarG (AppG (fromList [EmptyG]))

(3,46)-(3,56)
(n mod 10) :: ns
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

*)
