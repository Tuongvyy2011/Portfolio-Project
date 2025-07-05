## I. Portfolio 1 : Automating Crypto Website API Pull Using Python 





## II. Portfolio 2 : CORONA_VIRUS(2020_2021)
Xin chào, tôi có một Portfolio về dữ liệu CoronaVirus từ năm 2020-2021, trong Portfolio này tôi đã thực hiện một project đầy đủ như làm sạch dữ liệu, khám phá dữ liệu EDA trên SQL và trực quan hoá dữ liệu này trên Tableau.

Link Dataset: https://ourworldindata.org/explorers/covid?tab=table&time=2020-03-01..latest&country=IND~USA~GBR~CAN~DEU~FRA&pickerSort=asc&pickerMetric=location&hideControls=false&Metric=Excess+mortality+%28estimates%29&Interval=7-day+rolling+average&Relative+to+population=true

Hoặc tôi đã truy cập dữ liệu của Our World in Data tại github: https://github.com/owid/covid-19-data/tree/master/public/data

### Làm sạch dữ liệu, khám phá dữ liệu EDA trên SQL
Đầu tiên tôi đã chia dữ liệu thành 2 File csv khác nhau, gồm File CovidDeaths và Bảng CovidVaccinations. Sau đó, Tôi đã thực hiện các truy vấn trong MySQL theo:
1. Quốc gia
- Tỷ lệ tử vong/ số ca mắc bệnh
- Tỷ lệ tử vong/ số ca mắc bệnh ở VN ( Khả năng tử vong nếu bạn mắc phải covid ở quốc gia của bạn )
- Tỷ lệ phần trăm dân số mắc covid
- Các quốc gia có tỷ lệ lây nhiễm cao nhất trên mỗi dân số
- Các quốc gia có số ca tử vong cao nhất 

2. Châu lục
- Các châu lục có số ca tử vong cao nhất 

3.Toàn cầu: Không chia theo châu lục hay quốc gia nào
- Tổng số ca mắc mới, tổng số ca tử vong mới và tỷ lệ tử vong trên toàn cầu theo ngày

4.Số người tiêm chủng 
- Tổng số người đã được tiêm chủng theo từng quốc gia
- Tổng lăn của số người đã được tiêm chủng theo từng quốc gia
- Tỷ lệ phần trăm dân số ở từng quốc gia đã được tiêm vaccin theo tổng lăn

5.Các thành phần khác
- Có sự khác biệt nào giữa các quốc gia có chỉ số phát triển con người cao và các quốc gia có chỉ số phát triển con người thấp không?
- Mối quan hệ giữa tỷ lệ người được tiêm vắc-xin đầy đủ và tỷ lệ tử vong mới là gì?
  

### Trực quan hoá dữ liệu bằng Tableau
Sau khi làm sạch và phân tích quy trình EDA, tôi đã làm 4 biểu đồ trực quan hoá khác nhau trong Tableau về:

Biểu đồ 1 - Text Table : Bảng so sánh Tổng số trường hợp mắc bệnh, Tổng số ca tử vong và Tỷ lệ phần trăm số ca tử vong trên toàn thế giới

Biểu đồ 2 - Bar chart : Biểu đồ cho biết châu lục nào có số ca tử vong ca nhất

Biểu đồ 3 - Maps : Phần trăm dân số bị nhiễm bệnh trên mỗi quốc gia

Biểu đồ 4 - Line: Dự đoán phần trăm số dân nhiễm bệnh tăng lên trên các quốc gia

Biểu đồ 5 - Bar chart : Tổng số ca chết so với chỉ số HDI của các nhóm quốc gia

<img width="1389" alt="Screenshot 2025-07-01 at 01 00 03" src="https://github.com/user-attachments/assets/7b211d3d-9e77-4b02-98ba-a166b696746b" />

Final Tableau Dashboard:
https://public.tableau.com/app/profile/vy.vu6590/viz/TableauVisualizationCoranaVirus2020-2021/Dashboard1

## III. Portfolio 3 : Data Cleaning Nashville_housing in SQL





## IV. Portfolio 4 : Correlation Movie Industry in Python
