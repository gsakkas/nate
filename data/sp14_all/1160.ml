
let rec digitsOfInt n =
  let rec integers a b =
    if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
  integers n 0;;


(* fix

let rec digitsOfInt n =
  if n = 0
  then [0]
  else
    (let rec integers a b =
       if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
     integers n []);;

*)

(* changed spans
(3,2)-(5,14)
if n = 0
then [0]
else (let rec integers =
        fun a ->
          fun b ->
            if a = 0
            then b
            else integers (a / 10)
                          ((a mod 10) :: b) in
      integers n [])
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (LetG Rec (fromList [EmptyG]) EmptyG)

(5,13)-(5,14)
[]
ListG EmptyG Nothing

*)
