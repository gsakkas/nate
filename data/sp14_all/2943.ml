
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
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then l
  else
    (let a = [i] in bigAdd ((mulByDigit i) - (1 l)) ((mulByDigit i) - (1 l)));;


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
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then l
  else (let a = [i] in bigAdd (mulByDigit (i - 1) l) (mulByDigit (i - 1) l));;

*)

(* changed spans
(32,27)-(32,51)
mulByDigit (i - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

(32,52)-(32,76)
mulByDigit (i - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (31,30)-(31,52)) (Var (Just (31,31)-(31,41)) "mulByDigit") [Bop (Just (31,42)-(31,49)) Minus (Var (Just (31,43)-(31,44)) "i") (Lit (Just (31,47)-(31,48)) (LI 1)),Var (Just (31,50)-(31,51)) "l"]
App (Just (31,53)-(31,75)) (Var (Just (31,54)-(31,64)) "mulByDigit") [Bop (Just (31,65)-(31,72)) Minus (Var (Just (31,66)-(31,67)) "i") (Lit (Just (31,70)-(31,71)) (LI 1)),Var (Just (31,73)-(31,74)) "l"]
*)

(* typed spans
(31,30)-(31,52)
(31,53)-(31,75)
*)

(* correct types
int list
int list
*)

(* bad types
int
int
*)
