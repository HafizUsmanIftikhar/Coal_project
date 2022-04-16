[org 0x0100]
mov ax,0
mov bx,0
mov cx,0
mov di,0
jmp main
menu db 0x0a,'******MENU********$'
menu1 db 0x0a,'Press 1 for rikshw$'
menu2 db 0x0a,'Press 2 for cars$'
menu3 db 0x0a,'Press 3 for bus$'
menu4 db 0x0a,'Press 4 to show the record$'
menu5 db 0x0a,'Press 5 to delete the all parking record$'
menu6 db 0x0a,'Press 6 to exit$'
menu7 db 0x0a,'Press 7 for delete rikshw$'
menu8 db 0x0a,'Press 8 for delete cars$'
menu9 db 0x0a,'Press 9 for delete bus$'

msg1 db 0x0a,'you canot book more than 9 at a time $'
msg2 db 'Wrong input$'
msg3 db 'car$'
msg4 db 'bus$'
msg5 db 'record$'
msg6 db 0x0a,'press 1 to go main menu',0x0a,' $'
msg7 db 'the Total amount is=$'
msg8 db 0x0a,'  The total numbers of vehicles parked=$'
msg9 db 0x0a,'  The total number of rikshws parked=$'
msg11 db 0x0a,'  The total number of cars parked=$'
msg10 db 0x0a,'  The total number of buses parked=$'
msg12 db 0x0a,'**  Record deleted successfully **$'
msg13 db 0x0a,'**  There is no more vehicles in this type in parking  **$'
msg14 db 0x0a,'**  Bus no #### is gone **$'
msg15 db 0x0a,'**  Car no #### is gone **$'
msg16 db 0x0a,'**  Rikshw no #### gone **$'


brikhaw db 0x0a,' Rikshw is booked',0x0a,'$'
bbus db 0x0a,' Bus is booked',0x0a,'$'
bcar db 0x0a,' Car is booked',0x0a,'$'
main:
mov al,0

mov dx,menu
mov ah,9
int 0x21

mov dx,menu1
mov ah,9
int 0x21

mov dx,menu2
mov ah,9
int 0x21

mov dx,menu3
mov ah,9
int 0x21

mov dx,menu4
mov ah,9
int 0x21

mov dx,menu5
mov ah,9
int 0x21

mov dx,menu7
mov ah,9
int 0x21

mov dx,menu8
mov ah,9
int 0x21

mov dx,menu9
mov ah,9
int 0x21

mov dx,menu6
mov ah,9
int 0x21
mov ah,1
int 0x21
cmp al,'6'
jz allskip
cmp al,'1'
jz rikshw
cmp al,'2'
jz cars
cmp al,'3'
jz  bus
cmp al,'4'
jz record

cmp al,'5'     
jz delete

cmp al,'7'
jz delete1

cmp al,'8'
jz delete2

cmp al,'9'
jz delete3

rikshw:
cmp di,9
jz l0
add di,1
mov dx,brikhaw
mov ah,9
int 0x21
jmp allskip
l0:
mov dx,msg1
mov ah,9
int 0x21

jmp allskip


delete:
mov dx,msg12
mov ah,9
int 0x21
mov bx,0
mov cx,0
mov di,0
jmp allskip


delete1:
cmp di,0
jz p1
dec di
mov dx,msg16
mov ah,9
int 0x21
jmp allskip
p1:
mov dx,msg13
mov ah,9
int 0x21
jmp allskip



delete2:

cmp cx,0
jz p11
dec cx
mov dx,msg15
mov ah,9
int 0x21
jmp allskip
p11:
mov dx,msg13
mov ah,9
int 0x21
jmp allskip


delete3:
cmp bx,0
jz p2
dec bx
mov dx,msg14
mov ah,9
int 0x21
jmp allskip
p2:
mov dx,msg13 
mov ah,9
int 0x21
jmp allskip



bus:
cmp bx,9
jz l2
add bx,1
mov dx,bbus
mov ah,9
int 0x21
jmp allskip

l2:
mov dx,msg1
mov ah,9
int 0x21
jmp allskip

cars:
cmp cx,9
jz l3
add cx,1
mov dx,bcar
mov ah,9
int 0x21
jmp allskip

l3:
mov dx,msg1
mov ah,9
int 0x21
jmp allskip


record:
mov dx,msg9
mov ah,9
int 0x21
mov dx,di
add dx,48
mov ah,2
int 0x21

mov dx,msg10
mov ah,9
int 0x21
mov dx,bx
add dx,48
mov ah,2
int 0x21

mov dx,msg11
mov ah,9
int 0x21
mov dx,cx
add dx,48
mov ah,2
int 0x21

allskip:
cmp al,'6'
jnz main



mov ax,0x4c00
int 0x21