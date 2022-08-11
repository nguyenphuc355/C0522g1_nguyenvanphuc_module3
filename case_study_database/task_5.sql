use casestudy_database;

-- 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của 
-- tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dich_vu.ma_dich_vu, 
dich_vu.ten_dich_vu, 
dich_vu.dien_tich, 
dich_vu.chi_phi_thue, 
loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where dich_vu.ma_dich_vu
not in 
(select dich_vu.ma_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where (year(ngay_lam_hop_dong) = 2021) and (month(ngay_lam_hop_dong ) between 1 and 3))
group by dich_vu.ma_dich_vu
order by dien_tich desc;


-- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select  dich_vu.ma_dich_vu,
dich_vu.ten_dich_vu,
dich_vu.dien_tich,
dich_vu.so_nguoi_toi_da,
dich_vu.chi_phi_thue,
loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where year(ngay_lam_hop_dong) = 2020 and hop_dong.ma_dich_vu
not in
(select hop_dong.ma_dich_vu
from hop_dong
where (year(hop_dong.ngay_lam_hop_dong) = 2021))
group by dich_vu.ma_dich_vu;


-- 8.Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- cách 1
select ho_ten from khach_hang
group by ho_ten;

-- cách 2
select distinct ho_ten from khach_hang; 

-- cách 3
select ho_ten from khach_hang
union
select ho_ten from khach_hang;

-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với
--  mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(ngay_lam_hop_dong) as thang, count(ma_khach_hang) as so_luong_khach_hang from hop_dong
where year(ngay_lam_hop_dong)=2021
group by thang
order by ngay_lam_hop_dong;


-- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hop_dong.ma_hop_dong,
 hop_dong.ngay_lam_hop_dong, 
 hop_dong.ngay_ket_thuc,
 hop_dong.tien_dat_coc,
ifnull(sum(so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by ma_hop_dong








