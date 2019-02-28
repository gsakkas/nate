
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
          | [] -> if (i * h) > 10 then [carry i h] @ [remainder i h] else []
          | h'::t' ->
              (mulByDigit i t') @
                ([(carry i h) + (remainder h' i)] @
                   [(remainder h i) + (carry i)])));;


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
          | [] -> if (i * h) > 10 then [carry i h] @ [remainder i h] else []
          | h'::t' ->
              (mulByDigit i t') @
                ([(carry i h) + (remainder h' i)] @ [remainder h i])));;

*)

(* changed spans
(18,20)-(18,47)
remainder h i
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (17,53)-(17,66)) (Var (Just (17,53)-(17,62)) "remainder") [Var (Just (17,63)-(17,64)) "h",Var (Just (17,65)-(17,66)) "i"]
*)

(* typed spans
(17,53)-(17,66)
*)

(* correct types
int
*)

(* bad types
int
*)
