
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let f a x = a + x in
           let base = 0 in
           (match [List.fold_left f base (h :: t)] with
            | [] -> []
            | a::b ->
                let rec helper acc v =
                  if v = 0
                  then acc
                  else ((v / 10) mod 10) :: ((v mod 10) :: acc) :: acc in
                helper [] a));;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let f a x = a + x in
           let base = 0 in
           (match [List.fold_left f base (h :: t)] with
            | [] -> []
            | a::b ->
                let rec helper acc v =
                  if v = 0
                  then acc
                  else ((v / 10) mod 10) :: (v mod 10) :: acc in
                helper [] a));;

*)

(* changed spans
(19,44)-(19,63)
v mod 10
BopG VarG LitG

(19,44)-(19,63)
acc
VarG

*)

(* changed exprs
Bop (Just (19,44)-(19,54)) Mod (Var (Just (19,45)-(19,46)) "v") (Lit (Just (19,51)-(19,53)) (LI 10))
Var (Just (19,58)-(19,61)) "acc"
*)

(* typed spans
(19,44)-(19,54)
(19,58)-(19,61)
*)

(* correct types
int
int list
*)

(* bad types
int list
int list
*)
