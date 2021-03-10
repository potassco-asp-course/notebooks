job(1..4). machine(1..4).
duration(1,1,7).
duration(1,2,1).
duration(1,3,7).
duration(1,4,3).
duration(2,1,7).
duration(2,2,5).
duration(2,3,8).
duration(2,4,3).
duration(3,1,7).
duration(3,2,9).
duration(3,3,8).
duration(3,4,1).
duration(4,1,9).
duration(4,2,5).
duration(4,3,9).
duration(4,4,2).
sequence(1,1,4).
sequence(1,2,1).
sequence(1,3,3).
sequence(1,4,2).
sequence(2,1,1).
sequence(2,2,4).
sequence(2,3,2).
sequence(2,4,3).
sequence(3,1,3).
sequence(3,2,2).
sequence(3,3,1).
sequence(3,4,4).
sequence(4,1,3).
sequence(4,2,4).
sequence(4,3,1).
sequence(4,4,2).






%Answer: 1
%permutation(2,3) permutation(4,2) permutation(1,4) dl((1,1),0) dl(bound,48) dl((1,2),7) dl((1,3),8) dl((1,4),15) dl((2,1),16) dl((2,2),23) dl((2,3),30) dl((2,4),38) dl((3,1),23) dl((3,2),30) dl((3,3),39) dl((3,4),47) dl((4,1),7) dl((4,2),16) dl((4,3),21) dl((4,4),30)
%Answer: 2
%permutation(2,1) permutation(4,2) permutation(1,3) dl((1,1),16) dl(bound,48) dl((1,2),23) dl((1,3),31) dl((1,4),38) dl((2,1),9) dl((2,2),16) dl((2,3),23) dl((2,4),31) dl((3,1),23) dl((3,2),30) dl((3,3),39) dl((3,4),47) dl((4,1),0) dl((4,2),9) dl((4,3),14) dl((4,4),23)
%Answer: 3
%permutation(2,3) permutation(4,1) permutation(1,2) dl((1,1),9) dl(bound,48) dl((1,2),16) dl((1,3),23) dl((1,4),30) dl((2,1),16) dl((2,2),23) dl((2,3),30) dl((2,4),38) dl((3,1),23) dl((3,2),30) dl((3,3),39) dl((3,4),47) dl((4,1),0) dl((4,2),9) dl((4,3),14) dl((4,4),23)
%Answer: 4
%permutation(2,4) permutation(4,3) permutation(1,2) dl((1,1),0) dl(bound,48) dl((1,2),7) dl((1,3),8) dl((1,4),15) dl((2,1),7) dl((2,2),14) dl((2,3),19) dl((2,4),27) dl((3,1),23) dl((3,2),30) dl((3,3),39) dl((3,4),47) dl((4,1),14) dl((4,2),23) dl((4,3),28) dl((4,4),37)
%Answer: 5
%permutation(2,4) permutation(4,1) permutation(1,3) dl((1,1),16) dl(bound,48) dl((1,2),23) dl((1,3),30) dl((1,4),37) dl((2,1),0) dl((2,2),7) dl((2,3),12) dl((2,4),20) dl((3,1),23) dl((3,2),30) dl((3,3),39) dl((3,4),47) dl((4,1),7) dl((4,2),16) dl((4,3),21) dl((4,4),30)
%Answer: 6
%permutation(2,1) permutation(4,3) permutation(1,4) dl((1,1),7) dl(bound,48) dl((1,2),14) dl((1,3),20) dl((1,4),27) dl((2,1),0) dl((2,2),7) dl((2,3),12) dl((2,4),20) dl((3,1),23) dl((3,2),30) dl((3,3),39) dl((3,4),47) dl((4,1),14) dl((4,2),23) dl((4,3),28) dl((4,4),37)
