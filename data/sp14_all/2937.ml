
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,g) -> f in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit =
        match x with | (f,g) -> ((f + g) + carry) mod 10 | [] -> carry in
      match a with | (o,p) -> (newc, (digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,g) -> f in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with | (o,p) -> (newc, (digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,8)-(20,70)
match x with
| (f , g) -> ((f + g) + carry) mod 10
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (19,18)-(19,66)) (Var (Just (19,24)-(19,25)) "x") [(TuplePat (Just (19,34)-(19,37)) [VarPat (Just (19,34)-(19,35)) "f",VarPat (Just (19,36)-(19,37)) "g"],Nothing,Bop (Just (19,42)-(19,66)) Mod (Bop (Just (19,42)-(19,59)) Plus (Bop (Just (19,43)-(19,50)) Plus (Var (Just (19,44)-(19,45)) "f") (Var (Just (19,48)-(19,49)) "g")) (Var (Just (19,53)-(19,58)) "carry")) (Lit (Just (19,64)-(19,66)) (LI 10)))]
*)

(* typed spans
(19,18)-(19,66)
*)

(* correct types
int
*)

(* bad types
int
*)
