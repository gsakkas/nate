
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNumbs n = match n with | [] -> 0 | h::t -> h + (addNumbs t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match digits n with | [] -> 0 | h::t -> addNumbs n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNumbs n = match n with | [] -> 0 | h::t -> h + (addNumbs t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match digits n with | [] -> 0 | h::t -> addNumbs (h :: t);;

*)

(* changed spans
(10,51)-(10,52)
h :: t
ConAppG (Just (TupleG (fromList [VarG])))

*)

(* changed exprs
ConApp (Just (10,51)-(10,59)) "::" (Just (Tuple (Just (10,52)-(10,58)) [Var (Just (10,52)-(10,53)) "h",Var (Just (10,57)-(10,58)) "t"])) Nothing
*)

(* typed spans
(10,51)-(10,59)
*)

(* correct types
int list
*)

(* bad types
int
*)
