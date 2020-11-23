.model small
.data
a db 63h
b db 88h

.code
mov ax,@data
mov ds,ax
mov al,a
add al,b
daa
mov ah,4ch
int 21h
end
