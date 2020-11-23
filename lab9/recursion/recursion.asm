.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.data
msg1 db 0dh,0ah, "Enter the value of n: $"
msg2 db 0dh,0ah,"Enter the value of r: $"
msg3 db 0dh,0ah,"Calculated successfully: $"
msg4 db 0dh,0ah,"Calculation Failed: $"
ncr dw 0

.code
mov ax,@data
mov ds,ax
xor ax,ax
xor bx,bx
display msg1
xor ax,ax
call read
push ax
display msg2
xor ax,ax
call read
mov bx,ax
pop ax
call calc
xor cx,cx
mov cx,ncr
mov ah,4ch
int 21h


calc proc near
cmp ax,bx
je r1
cmp bx,0
je r1
cmp bx,1
je r3
dec ax
cmp bx,ax
je r2
push ax
push bx
call calc
pop bx
pop ax
dec bx
push ax
push bx
call calc
pop bx
pop ax
ret

r1: inc ncr
ret

r2: inc ncr

r3: add ncr,ax
    ret


read proc near
mov ah,01h
int 21h
xor ah,ah
sub al,30h
ret
end

