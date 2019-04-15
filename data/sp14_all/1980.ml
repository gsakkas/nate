
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(3,25)-(3,61)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG (fromList [(LitPatG,Nothing,ListG (fromList [])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,25)-(3,47)
(3,25)-(3,61)
(3,26)-(3,37)
(3,51)-(3,61)
*)
