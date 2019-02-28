
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with | false  -> n :: (digitsOfInt (n / 10)) | true  -> 1);;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> [1]);;

*)

(* changed spans
(6,75)-(6,76)
[1]
ListG LitG

*)

(* changed exprs
List (Just (8,18)-(8,21)) [Lit (Just (8,19)-(8,20)) (LI 1)] Nothing
*)

(* typed spans
(8,18)-(8,21)
*)

(* correct types
int list
*)

(* bad types
int
*)
