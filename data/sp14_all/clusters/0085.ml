CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
match rand (1 , 7) with
| 1 -> buildX ()
| 2 -> buildY ()
| 3 -> buildSine (if depth = 0
                  then buildX ()
                  else build (rand , depth - 1))
| 4 -> buildCosine (if depth = 0
                    then buildY ()
                    else build (rand , depth - 1))
| 5 -> buildAverage (if depth = 0
                     then buildX ()
                     else build (rand , depth - 1) , if depth = 0
                                                     then buildY ()
                                                     else build (rand , depth - 1))
| 6 -> buildTimes (if depth = 0
                   then buildX ()
                   else build (rand , depth - 1) , if depth = 0
                                                   then buildY ()
                                                   else build (rand , depth - 1))
| 7 -> buildThresh (if depth = 0
                    then buildX ()
                    else build (rand , depth - 1) , if depth = 0
                                                    then buildY ()
                                                    else build (rand , depth - 1) , if depth = 0
                                                                                    then buildX ()
                                                                                    else build (rand , depth - 1) , if depth = 0
                                                                                                                    then buildY ()
                                                                                                                    else build (rand , depth - 1))
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 2) , build (rand , depth - 2))
| 3 -> buildTimes (build (rand , depth - 2) , build (rand , depth - 2))
| 4 -> buildThresh (build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4))
| _ -> buildY ()
