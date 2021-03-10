job(1..3). machine(1..2).
duration(1,1,4).
duration(1,2,1).
duration(2,1,2).
duration(2,2,5).
duration(3,1,2).
duration(3,2,8).
sequence(1,1,2).
sequence(1,2,1).
sequence(2,1,2).
sequence(2,2,1).
sequence(3,1,2).
sequence(3,2,1).






%Answer: 1
%permutation(2,3) permutation(3,1) dl((1,1),4) dl(bound,16) dl((1,2),15) dl((2,1),0) dl((2,2),2) dl((3,1),2) dl((3,2),7)
%Answer: 2
%permutation(3,1) permutation(1,2) dl((1,1),2) dl(bound,16) dl((1,2),10) dl((2,1),6) dl((2,2),11) dl((3,1),0) dl((3,2),2)
%Answer: 3
%permutation(2,1) permutation(3,2) dl((1,1),4) dl(bound,16) dl((1,2),15) dl((2,1),2) dl((2,2),10) dl((3,1),0) dl((3,2),2)
%Answer: 4
%permutation(2,1) permutation(1,3) dl((1,1),2) dl(bound,16) dl((1,2),7) dl((2,1),0) dl((2,2),2) dl((3,1),6) dl((3,2),8)
