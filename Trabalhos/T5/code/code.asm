j main

bolha:
    addi $sp, %sp, -20    #espaço pra 5 valores
    sw $ra, 16($sp)        #salva ra,s3,s2... na pilha
    sw $s3, 12($sp)
    sw $s2, 8($sp)
    sw $s1, 4($sp)
    sw $s0, 0($sp)

    add $s2, $a0,$zero        #salva $a0 e $a1 em $s2 e s3
    add $s3, $a1,$zero
    add $s0, $zero, $zero        #i=0

for1:
    slt $t0, $s0, $s3    #$t0 = 0 se $s0 > $s3
    beq $t0, $zero, exit1    #vai pra exit se $s0 > $s3
for2:
    add $s1, $zero, $zero     #j=0
    sub $t1, $s3, $s0    #t1 = n-i
    addi $t1, $t1,-1    #t1 = t1-1
    slt $t2,$s1,$t1        #t2 = 1 se $s1<t1
    beq $t2,$zero,exit2    #vai pra exit2 se j>=$t1
    sll $t3,s1,2         #t3 = j*4
    add $t3,$s2,$t3        #t3 = v[j]
    lw $t4, 0($t3)         #t4 = v[j]
    lw $t5, 4($t3)        #t5 = v[j+1]
    slt $t6,$t4,$t3        #t6 = 0 se $t4>$t3
    beq $t6, $zero,exit2    #vai pra exit2 se $t4>$t3
    sw $t4, 0($a0)        #v[j] = $t4
    sw $t3, 4($a0)        #v[j+1] = $t3
    addi $s1, $s1,1        #j+1
    j for2            #volta pro loop 2
exit2:
    addi $s0,$s0,1        #i+1
    j for1            #volta pro loop 1
exit1:
    lw $s0,0($sp)        #restaura ra,s3...
    lw $s1,4($sp)
    lw $s2,8($sp)
    lw $s3,12($sp)
    lw $ra,16($sp)
    addi $sp,$sp,20        #libera espaço
    jr $ra            #retorna

main:
    #Memory allocation
    addi $t7, $zero, 2
    sw $t7, 0($s4)
    addi $t7, $zero, 4
    sw $t7, 4($s4)
    addi $t7, $zero, 7
    sw $t7, 8($s4)
    addi $t7, $zero, 24
    sw $t7, 12($s4)
    #Code
    addi $a0, $zero, 2
    addi $a1, $zero, 2
    add $a2, $s4, $zero
    jal max_min
    #Memory allocation
    add $a0, $v0, $zero
    add $a1, $v1, $zero
    #Code
    jal multiply
    or $t0, $v0, $zero
