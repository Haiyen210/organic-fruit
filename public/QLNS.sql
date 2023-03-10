Create database QLNS;

go
    use QLNS;

go
    Create table Banner(
        ID int identity primary key,
        Code nvarchar(50) not null,
        Name nvarchar(150) not null,
        Images nvarchar(150) not null,
        Status bit default 1,
        CreatedDate date DEFAULT GETDATE(),
        ModiredDate date DEFAULT GETDATE()
    )
go
    Create table Blog(
        ID int identity primary key,
        Code nvarchar(50) not null,
        Name nvarchar(150) not null,
        Description nvarchar(200) not null,
        Images nvarchar(150) not null,
        Status bit default 1,
        CreatedDate date DEFAULT GETDATE(),
        ModiredDate date DEFAULT GETDATE()
    )
go
    Create table Account(
        ID int identity primary key,
        Code nvarchar(50) not null,
        Name nvarchar(150) not null,
        Email nvarchar(150) not null,
        Phone nvarchar(150) not null,
        Address nvarchar(150) not null,
        Birthday nvarchar(150) not null,
        Gender bit default 1,
        Images nvarchar(150) null,
        Role bit default 1,
        CreatedDate date DEFAULT GETDATE(),
        ModiredDate date DEFAULT GETDATE()
    )
go
    Create table Category(
        ID int identity primary key,
        Code nvarchar(50) not null,
        Name nvarchar(150) not null,
        Description nvarchar(200) not null,
        Status bit default 1,
        CreatedDate date DEFAULT GETDATE(),
        ModiredDate date DEFAULT GETDATE()
    )
go
    Create table Product(
        ID int identity primary key,
        Code nvarchar(50) not null,
        Name nvarchar(150) not null,
        CategoryID int foreign key references Category(ID) not null,
        Description nvarchar(200) not null,
        Images nvarchar(150) not null,
        Price float not null,
        SalePrice float,
        Status bit default 1,
        CreatedDate date DEFAULT GETDATE(),
        ModiredDate date DEFAULT GETDATE()
    )
go
    Create table Orders(
        ID int identity primary key,
        Code nvarchar(50) not null,
        Name nvarchar(150) not null,
        Email varchar(150) not null,
        Phone varchar(150) not null,
        Address nvarchar(150) not null,
        TotalQuantity int,
        TotalPrice float,
        Status bit default 1,
        AccountID int foreign key references Account(ID),
        CreatedDate date DEFAULT GETDATE(),
        ModiredDate date DEFAULT GETDATE()
    )
go
    Create table OrderDetail(
        ID int identity primary key,
        ProductID int foreign key references Product(ID) not null,
        OrderID int foreign key references Orders(ID) not null,
        Price float not null,
        Quantity int not null,
        CreatedDate date DEFAULT GETDATE(),
        ModiredDate date DEFAULT GETDATE()
    )
go
    Create table Favorite(
        ID int identity primary key,
        ProductID int foreign key references Product(ID) not null,
        AccountID int foreign key references Account(ID) not null,
        CreatedDate date DEFAULT GETDATE(),
        ModiredDate date DEFAULT GETDATE()
    )
go
    Create table Rating(
        ID int identity primary key,
        ProductID int foreign key references Product(ID) not null,
        AccountID int foreign key references Account(ID) not null,
        Star float not null,
        Description nvarchar(200) not null,
        Status bit default 1,
        CreatedDate date DEFAULT GETDATE(),
        ModiredDate date DEFAULT GETDATE()
    )
INSERT INTO
    Category (Code, Name, Description)
values
(
        N 'NK342',
        N'Tr??i c??y nh???p kh???u',
        N'Tr??i c??y ???????c nh???p kh???u t??? c??c n?????c kh??c nhau'
    );

INSERT INTO
    Category (Code, Name, Description)
values
(
        N 'TN236',
        N'Tr??i c??y trong n?????c',
        N'Tr??i c??y ?????c s???n c???a c??c v??ng mi???n trong n?????c'
    );

INSERT INTO
    Category (Code, Name, Description)
values
(
        N'GQ872',
        N'Gi??? qu??',
        N'Tr??i c??y ho???c ????? kh?? ???????c ????ng th??nh gi???'
    );

INSERT INTO
    Category (Code, Name, Description)
values
(
        N'TP895',
        N'Th???c ph???m',
        N'Th???c ph???m ??n u???ng h??ng ng??y'
    );

INSERT INTO
    Category (Code, Name, Description)
values
(
        N'??K357',
        N'????? kh??',
        N'Th???c ph???m kh?? v?? c??c lo???i h???t'
    );

Go
INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00001',
        N 'Nho ??en Nam Phi',
        100000,
        N'nhodennamphi1.jpg',
        1,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00002',
        N 'Nho ??c Sweetglobe',
        175000,
        N'nhoxanhuc1.jpg',
        1,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00003',
        N'Qu??t Baby ????i Loan',
        75000,
        N'quytbabydailoan1.jpg',
        1,
        N'M???ng v???, th??m, t????i, ng???t ?????m. 1kg kho???ng 8-9 qu???'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00005',
        N'D??a L?????i ????i Loan',
        160000,
        N'dualuoidailoan1.jpg',
        1,
        N'Ru???t cam, ng???t l???m, th??m, thanh m??t  '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00006',
        N 'Nho xanh Nam Phi',
        155000,
        N'nhoxanhnamphi1.png',
        1,
        N ' Nho c?? d??ng thu??n, v??? m???ng, m??u xanh h??? ph??ch b???t m???t. Th???t nho gi??n tan, kh??ng h???t, v??? ng???t ?????m ???? r???t ngon. '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00007',
        N'H???ng Xi??m Xu??n ?????nh',
        45000,
        N'hongxiemxuandinh1.jfif',
        2,
        N 'H???ng xi??m Xu??n ?????nh c?? h????ng th??m v?? v??? ng???t r???t ?????c bi???t. Nh???ng mi???ng h???ng xi??m khi c???t m??u m???t ong ??ng ???,th???t h???ng m???n'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00008',
        N'B?? S??p Qu???c Minh',
        75000,
        N'bosapquocminh1.jpg',
        2,
        N'C??m b??: v??ng m??u m??? g??, d???o v?? b??o d???ng ??? m???c ????? v???a ph???i, th??ch h???p cho ??n s???ng ho???c xay sinh t???, ??n salad '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00009',
        N '???i N??? Ho??ng',
        30000,
        N'oinuhoang1.jpg',
        2,
        N '???i n??? ho??ng qu??? to, xanh, gi??n, ??n v??o c?? v??? chua ng???t, h???t r???t ??t. M???t ????a ???i N??? Ho??ng k??m ch??n mu???i ???t cay n???ng s??? l?? s??? k???t h???p ho??n h???o cho b???a ??n v???t th??m ngon, t???t cho s???c kh???e. '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00010',
        N'Xo??i Keo',
        28000,
        N'xoaikeo1.jfif',
        2,
        N'Lo???i tr??i c??y ph??? bi???n ???????c ??a chu???ng gi??u ch???t x??, vitamin, kho??ng ch???t thi???t y???u gi??p cung c???p ch???t dinh d?????ng cho c?? th??? con ng?????i v?? mang l???i nhi???u l???i ??ch tuy???t v???i cho h??? ti??u h??a, tim m???ch, gi??p m???t s??ng, l??m ?????p da. Xo??i keo c?? qu??? ch???c gi??n gi??n chua ng???t th??m ngon ???????c nhi???u ng?????i ??a th??ch '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00011',
        N'V?? S???a T??m',
        45000,
        N'vusuatim1.jpg',
        2,
        N'Kh??ng ch??? th??m v?? ng???t, v?? s???a c?? nhi???u c??ng d???ng ?????i v???i s???c kh???e  '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00012',
        N'V???i Thi???u Thanh H??',
        30000,
        N'vaithieuthanhha1.jpg',
        2,
        N'Th???t nhi???u, c??i d???y, h???t nh???,m??i th??m ?????c tr??ng, khi ??n b???n s??? c???m nh???n ???????c v??? ng???t, thanh m??t. '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00013',
        N'B?????i Da Xanh',
        80000,
        N'buoidaxanh1.jpg',
        2,
        N' ch???c qua??, vo?? thi?? la??i mo??ng,ha??t thi?? ra????t i??t '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00014',
        N'Cam S??nh Ti???n Giang',
        50000,
        N'camsanhtiengiang1.png',
        2,
        N'V??? cam s??nh m??u xanh ?????n xanh v??ng khi ch??n, s???n v?? d???y 3-5mm, t??p m??u v??ng cam ?????m, nhi???u n?????c, v??? ng???t chua m??i r???t th??m v?? kh?? nhi???u h???t '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00015',
        N'Ch??m ch??m nh??n',
        175000,
        N'nhoxanhuc1.jpg',
        2,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00016',
        N'Gi??? tr??i c??y GR10',
        550000,
        N'giotraicay1.jpg',
        3,
        N '2 cam m???/??c Premier
2 qu??t ??c S36
1 L?? H??n qu???c premium
1 kiwi v??ng
0.5 kg nho xanh/??en/????? M???/??c/Nam Phi
1 t??o xanh M???/Ph??p
gi??? m??y
n?? v?? v???t d???ng trang tr?? '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00017',
        N'Gi??? tr??i c??y GQTC1',
        1540000,
        N'giotraicay2.jpg',
        3,
        N 'Nho xanh nh???p kh???u 1kg (M???, ??c, Nam Phi)
Nho ?????/k???o/??en nh???p kh???u 1kg (M???, ??c, Nam Phi)
2 kiwi v??ng New Zealand/Ph??p
4 t??o Envy
3 l?? Nam Phi
3 l?? H??n Qu???c Premier
3 cam v??ng ??c Premier
gi??? m??y cao c???p
n?? v?? v???t d???ng trang tr?? '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00018',
        N'Gi??? tr??i c??y GQTC21',
        750000,
        N'giotraicay3.jpg',
        3,
        N '1 l?? H??n Qu???c Premier
8 t??o gala M??? S90 (ho???c t????ng ??????ng)
0.5kg nho xanh/?????/??en M???
2 cam v??ng ??c Premier
3 l?? Nam Phi
2 Qu??t ??c
gi??? c???p L
n?? v?? v???t d???ng trang tr?? '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00019',
        N'H???p tr??i c??y HT4',
        490000,
        N'hoptraicay1.jpg',
        3,
        N ' T??o queen, Breeze NZ ho???c t????ng ??????ng
Nho xanh M???/nho ??en M???
Cam ??c
L?? H??n Qu???c Premier
Kiwi xanh ho???c t????ng ??????ng
H???p qu?? in gi???y m??? thu???t th??m
N?? v?? v???t d???ng trang tr??'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00019',
        N'H???p tr??i c??y HQTC4',
        1600000,
        N'hoptraicay2.jpg',
        3,
        N 'D??u t??y H??n Qu???c 700gr lo???i 1
Nho xanh M???/??c/Nam Phi 2kg
Hoa trang tr??
1 c??nh h???ng ?????p th??m
h???p qu?? in gi???y m??? thu???t th??m
n?? v?? v???t d???ng trang tr??'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00020',
        N'Mi???n Gogi H??n Qu???c',
        850000,
        N'miengogihanquoc1.jpg',
        5,
        N'Mi???n khoai lang Gogi - H??n Qu???c 1kg'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00021',
        N'B???t Cacao Choco Quick Kruger H???p 800G',
        135000,
        N'botcacao1.png',
        5,
        N'???t ca cao pha s???a tr??? em Choco Quick Kkh??ng ch???a ch???t t???o m??u, t???o v??? v?? ch???t l??m ng???t nh??n t???o,l?? b???t s?? c?? la ho?? tan, b??? sung ch???t x??, t??ng h???p th??? Calcium, h??? tr??? ti??u ho??.'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00022',
        N 'Ru???c C?? H???i Soboro 160g Nh???t B???n',
        95000,
        N'ruoccahoi.jpg',
        5,
        N'Ru???c c?? h???i l?? th???c ph???m r???t gi??u omega 3 ??? DHA, c?? h??m l?????ng dinh d?????ng cao c??ng nh?? h????ng v??? th??m ngon, r???t t???t cho s??? ph??t tri???n c???a tr??? v?? ?????c bi???t t???t cho n??o b???.'
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00023',
        N 'D???u ??n H???t C???i Nh???t B???n',
        78000,
        N'dauanhatcai1.jpg',
        5,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00024',
        N'S???a Kid Essentials ??c 800g',
        570000,
        N'sua1.jpg',
        5,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00025',
        N'S???a Devondale 1Kg ??c',
        260000,
        N'sua2.jpg',
        5,
        N' '
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00026',
        N 'Kiwi V??ng Newzealand 500g',
        110000,
        N'kiwivang1.jpg',
        1,
        N''
    );

INSERT INTO
    Product (Code, Name, Price, Images, CategoryID, Description)
values
(
        N'00027',
        N 'Kiwi Xanh Newzealand 500g',
        190000,
        N'kiwixanh1.jpg',
        1,
        N''
    );

select
    *
from
    Product