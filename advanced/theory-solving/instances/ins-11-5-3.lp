job(1..5). machine(1..3).
duration(1,1,5).
duration(1,2,5).
duration(1,3,5).
duration(2,1,7).
duration(2,2,5).
duration(2,3,1).
duration(3,1,2).
duration(3,2,8).
duration(3,3,8).
duration(4,1,9).
duration(4,2,2).
duration(4,3,2).
duration(5,1,5).
duration(5,2,5).
duration(5,3,9).
sequence(1,1,1).
sequence(1,2,2).
sequence(1,3,3).
sequence(2,1,3).
sequence(2,2,1).
sequence(2,3,2).
sequence(3,1,1).
sequence(3,2,2).
sequence(3,3,3).
sequence(4,1,2).
sequence(4,2,3).
sequence(4,3,1).
sequence(5,1,3).
sequence(5,2,2).
sequence(5,3,1).






%Answer: 1
%permutation(3,1) permutation(4,2) permutation(5,4) permutation(1,5) dl((1,1),2) dl(bound,35) dl((1,2),10) dl((1,3),18) dl((2,1),21) dl((2,2),28) dl((2,3),34) dl((3,1),0) dl((3,2),2) dl((3,3),10) dl((4,1),12) dl((4,2),21) dl((4,3),32) dl((5,1),7) dl((5,2),15) dl((5,3),23)
%Answer: 2
%permutation(3,5) permutation(4,1) permutation(5,4) permutation(1,2) dl((1,1),16) dl(bound,35) dl((1,2),21) dl((1,3),29) dl((2,1),21) dl((2,2),28) dl((2,3),34) dl((3,1),0) dl((3,2),2) dl((3,3),10) dl((4,1),7) dl((4,2),16) dl((4,3),27) dl((5,1),2) dl((5,2),10) dl((5,3),18)
%Answer: 3
%permutation(2,4) permutation(3,5) permutation(5,1) permutation(1,2) dl((1,1),7) dl(bound,35) dl((1,2),15) dl((1,3),27) dl((2,1),12) dl((2,2),20) dl((2,3),32) dl((3,1),0) dl((3,2),2) dl((3,3),10) dl((4,1),19) dl((4,2),28) dl((4,3),33) dl((5,1),2) dl((5,2),10) dl((5,3),18)
%Answer: 4
%permutation(2,4) permutation(3,1) permutation(5,3) permutation(1,2) dl((1,1),7) dl(bound,35) dl((1,2),18) dl((1,3),27) dl((2,1),12) dl((2,2),23) dl((2,3),32) dl((3,1),5) dl((3,2),10) dl((3,3),19) dl((4,1),19) dl((4,2),28) dl((4,3),33) dl((5,1),0) dl((5,2),5) dl((5,3),10)
%Answer: 5
%permutation(3,4) permutation(4,1) permutation(5,3) permutation(1,2) dl((1,1),16) dl(bound,35) dl((1,2),21) dl((1,3),29) dl((2,1),21) dl((2,2),28) dl((2,3),34) dl((3,1),5) dl((3,2),10) dl((3,3),19) dl((4,1),7) dl((4,2),18) dl((4,3),27) dl((5,1),0) dl((5,2),5) dl((5,3),10)
%Answer: 6
%permutation(2,4) permutation(3,2) permutation(5,1) permutation(1,3) dl((1,1),5) dl(bound,35) dl((1,2),10) dl((1,3),19) dl((2,1),12) dl((2,2),23) dl((2,3),32) dl((3,1),10) dl((3,2),15) dl((3,3),24) dl((4,1),19) dl((4,2),28) dl((4,3),33) dl((5,1),0) dl((5,2),5) dl((5,3),10)
%Answer: 7
%permutation(3,4) permutation(4,2) permutation(5,1) permutation(1,3) dl((1,1),5) dl(bound,35) dl((1,2),10) dl((1,3),19) dl((2,1),21) dl((2,2),28) dl((2,3),34) dl((3,1),10) dl((3,2),15) dl((3,3),24) dl((4,1),12) dl((4,2),23) dl((4,3),32) dl((5,1),0) dl((5,2),5) dl((5,3),10)
%Answer: 8
%permutation(2,1) permutation(3,2) permutation(5,3) permutation(1,4) dl((1,1),14) dl(bound,35) dl((1,2),23) dl((1,3),28) dl((2,1),7) dl((2,2),18) dl((2,3),27) dl((3,1),5) dl((3,2),10) dl((3,3),19) dl((4,1),19) dl((4,2),28) dl((4,3),33) dl((5,1),0) dl((5,2),5) dl((5,3),10)
%Answer: 9
%permutation(3,1) permutation(4,2) permutation(5,3) permutation(1,4) dl((1,1),7) dl(bound,35) dl((1,2),18) dl((1,3),27) dl((2,1),21) dl((2,2),28) dl((2,3),34) dl((3,1),5) dl((3,2),10) dl((3,3),19) dl((4,1),12) dl((4,2),23) dl((4,3),32) dl((5,1),0) dl((5,2),5) dl((5,3),10)
%Answer: 10
%permutation(2,4) permutation(3,2) permutation(5,3) permutation(1,5) dl((1,1),0) dl(bound,35) dl((1,2),5) dl((1,3),10) dl((2,1),12) dl((2,2),23) dl((2,3),32) dl((3,1),10) dl((3,2),15) dl((3,3),24) dl((4,1),19) dl((4,2),28) dl((4,3),33) dl((5,1),5) dl((5,2),10) dl((5,3),15)
%Answer: 11
%permutation(3,4) permutation(4,2) permutation(5,3) permutation(1,5) dl((1,1),0) dl(bound,35) dl((1,2),5) dl((1,3),10) dl((2,1),21) dl((2,2),28) dl((2,3),34) dl((3,1),10) dl((3,2),15) dl((3,3),24) dl((4,1),12) dl((4,2),23) dl((4,3),32) dl((5,1),5) dl((5,2),10) dl((5,3),15)
%Answer: 12
%permutation(2,4) permutation(3,1) permutation(5,2) permutation(1,5) dl((1,1),2) dl(bound,35) dl((1,2),10) dl((1,3),18) dl((2,1),12) dl((2,2),20) dl((2,3),32) dl((3,1),0) dl((3,2),2) dl((3,3),10) dl((4,1),19) dl((4,2),28) dl((4,3),33) dl((5,1),7) dl((5,2),15) dl((5,3),23)
%Answer: 13
%permutation(2,1) permutation(3,5) permutation(5,2) permutation(1,4) dl((1,1),14) dl(bound,35) dl((1,2),20) dl((1,3),28) dl((2,1),7) dl((2,2),15) dl((2,3),27) dl((3,1),0) dl((3,2),2) dl((3,3),10) dl((4,1),19) dl((4,2),28) dl((4,3),33) dl((5,1),2) dl((5,2),10) dl((5,3),18)
%Answer: 14
%permutation(3,5) permutation(4,2) permutation(5,1) permutation(1,4) dl((1,1),7) dl(bound,35) dl((1,2),15) dl((1,3),27) dl((2,1),21) dl((2,2),28) dl((2,3),34) dl((3,1),0) dl((3,2),2) dl((3,3),10) dl((4,1),12) dl((4,2),21) dl((4,3),32) dl((5,1),2) dl((5,2),10) dl((5,3),18)
