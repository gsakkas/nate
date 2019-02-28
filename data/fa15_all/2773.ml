
let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> []
          | h'::t' ->
              if (List.length t') > 0
              then mulByDigit @ [(carry h i) + (remainder h' i)]
              else [remainder h i]));;


(* fix

let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> []
          | h'::t' ->
              if (List.length t') > 0
              then (mulByDigit i t) @ [(carry h i) + (remainder h' i)]
              else [remainder h i]));;

*)

(* changed spans
(17,19)-(17,29)
mulByDigit i t
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (17,19)-(17,35)) (Var (Just (17,20)-(17,30)) "mulByDigit") [Var (Just (17,31)-(17,32)) "i",Var (Just (17,33)-(17,34)) "t"]
*)

(* typed spans
(17,19)-(17,35)
*)

(* correct types
int list
*)

(* bad types
int list
*)
