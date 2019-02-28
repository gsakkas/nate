
let rec mulByDigit i l =
  match l with
  | [] -> []
  | z::x::x' -> [(x * i) / 10] @ (mulByDigit i [((x * i) mod 10) + z; x']);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | z::x::x' -> [(z * i) / 10] @ ((mulByDigit i [((z * i) mod 10) + x]) @ x');;

*)

(* changed spans
(5,18)-(5,19)
z
VarG

(5,34)-(5,44)
(@)
VarG

(5,34)-(5,44)
mulByDigit i
           [((z * i) mod 10) + x]
AppG (fromList [VarG,ListG EmptyG])

(5,47)-(5,73)
[((z * i) mod 10) + x]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
Var (Just (5,18)-(5,19)) "z"
Var (Just (5,72)-(5,73)) "@"
App (Just (5,34)-(5,71)) (Var (Just (5,35)-(5,45)) "mulByDigit") [Var (Just (5,46)-(5,47)) "i",List (Just (5,48)-(5,70)) [Bop (Just (5,49)-(5,69)) Plus (Bop (Just (5,49)-(5,65)) Mod (Bop (Just (5,50)-(5,57)) Times (Var (Just (5,51)-(5,52)) "z") (Var (Just (5,55)-(5,56)) "i")) (Lit (Just (5,62)-(5,64)) (LI 10))) (Var (Just (5,68)-(5,69)) "x")] Nothing]
List (Just (5,48)-(5,70)) [Bop (Just (5,49)-(5,69)) Plus (Bop (Just (5,49)-(5,65)) Mod (Bop (Just (5,50)-(5,57)) Times (Var (Just (5,51)-(5,52)) "z") (Var (Just (5,55)-(5,56)) "i")) (Lit (Just (5,62)-(5,64)) (LI 10))) (Var (Just (5,68)-(5,69)) "x")] Nothing
*)

(* typed spans
(5,18)-(5,19)
(5,72)-(5,73)
(5,34)-(5,71)
(5,48)-(5,70)
*)

(* correct types
int
int list -> int list -> int list
int list
int list
*)

(* bad types
int
int -> int list -> int list
int -> int list -> int list
int list
*)
