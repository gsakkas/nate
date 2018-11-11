
let sqsum xs =
  let f a x = a + (x ** 2) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (int_of_float ((float_of_int x) ** 2.0)) in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,18)-(3,26)
int_of_float
VarG

(3,18)-(3,26)
int_of_float (float_of_int x ** 2.0)
AppG [AppG [EmptyG,EmptyG]]

(3,19)-(3,20)
float_of_int
VarG

(3,19)-(3,20)
float_of_int x
AppG [VarG]

(3,24)-(3,25)
2.0
LitG

*)