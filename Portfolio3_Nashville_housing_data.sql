-- Portfolio Project: Nashville Housing Data

-- Data Cleaning in SQL

SELECT * FROM PortfolioProject.`nashville housing data`;

#1. Split the data of the 'Property Address' column, 'OwnerAddress' column and add null rows
#add null rows
SELECT *
FROM `nashville housing data`
WHERE PropertyAddress = '';

SELECT *
FROM `nashville housing data`
ORDER BY ParcelID;

SELECT *
FROM `nashville housing data` nh1
JOIN `nashville housing data` nh2
ON nh1.ParcelID = nh2.ParcelID
WHERE nh1.PropertyAddress = ''
AND nh2.PropertyAddress != '';

UPDATE `nashville housing data` nh1
JOIN `nashville housing data` nh2
ON nh1.ParcelID = nh2.ParcelID
SET nh1.PropertyAddress = nh2.PropertyAddress
WHERE nh1.PropertyAddress = ''
AND nh2.PropertyAddress != '';

#Split the data of the Property Address column
SELECT SUBSTRING(PropertyAddress, 1, LOCATE(',',PropertyAddress) -1) as Address,
SUBSTRING(PropertyAddress, LOCATE(',',PropertyAddress) +1, LENGTH(PropertyAddress)) as City
FROM `nashville housing data`;

ALTER TABLE `nashville housing data`
ADD PropertySplitAddress TEXT;

UPDATE `nashville housing data`
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, LOCATE(',',PropertyAddress) -1);

ALTER TABLE `nashville housing data`
ADD PropertySplitCity TEXT;

UPDATE `nashville housing data`
SET PropertySplitCity = SUBSTRING(PropertyAddress, LOCATE(',',PropertyAddress) +1, LENGTH(PropertyAddress));

SELECT *
FROM `nashville housing data`;


#Split the data of the 'OwnerAddress' column
SELECT OwnerAddress
FROM `nashville housing data`;

SELECT SUBSTRING_INDEX(OwnerAddress, ',', 1),
SUBSTRING_INDEX(SUBSTRING_INDEX(OwnerAddress, ',', 2), ',', -1),
SUBSTRING_INDEX(OwnerAddress, ',', -1)
FROM `nashville housing data`;


ALTER TABLE `nashville housing data`
ADD OwnerSplitAddress TEXT;

UPDATE `nashville housing data`
SET OwnerSplitAddress = SUBSTRING_INDEX(OwnerAddress, ',', 1);

ALTER TABLE `nashville housing data`
ADD OwnerSplitCity TEXT;

UPDATE `nashville housing data`
SET OwnerSplitCity = SUBSTRING_INDEX(SUBSTRING_INDEX(OwnerAddress, ',', 2), ',', -1);

ALTER TABLE `nashville housing data`
ADD OwnerSplitState TEXT;

UPDATE `nashville housing data`
SET OwnerSplitState = SUBSTRING_INDEX(OwnerAddress, ',', -1);

SELECT *
FROM `nashville housing data`;


#2. Change Y and N to Yes and No in the 'Sold as Vacant' column
#Change from Y and N to Yes and No because Yes and No are more numerous
SELECT DISTINCT SoldAsVacant, COUNT(SoldAsVacant)
FROM `nashville housing data`
GROUP BY SoldAsVacant
ORDER BY 2;

SELECT SoldAsVacant, 
CASE
	WHEN SoldAsVacant = 'Y' THEN 'Yes'
    WHEN SoldAsVacant = 'N' THEN 'No'
    ELSE SoldAsVacant
END
FROM `nashville housing data`;

UPDATE `nashville housing data`
SET SoldAsVacant = CASE
	WHEN SoldAsVacant = 'Y' THEN 'Yes'
    WHEN SoldAsVacant = 'N' THEN 'No'
    ELSE SoldAsVacant
END;


#3. Delete duplicates
SELECT *,
ROW_NUMBER() OVER(PARTITION BY ParcelID, PropertyAddress, LegalReference, SaleDate, SalePrice ORDER BY UniqueID) as row_num
FROM `nashville housing data`;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY ParcelID, PropertyAddress, LegalReference, SaleDate, SalePrice ORDER BY UniqueID) as row_num
FROM `nashville housing data`
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;


CREATE TABLE `nashville housing data 2`
SELECT *,
ROW_NUMBER() OVER(PARTITION BY ParcelID, PropertyAddress, LegalReference, SaleDate, SalePrice ORDER BY UniqueID) as row_num
FROM `nashville housing data`;

DELETE 
FROM `nashville housing data 2`
WHERE row_num > 1; 

SELECT *
FROM `nashville housing data 2`
WHERE row_num > 1; 

#4. Delete unused columns
SELECT *
FROM `nashville housing data 2`;

ALTER TABLE `nashville housing data 2`
DROP COLUMN row_num,
DROP COLUMN OwnerAddress,
DROP COLUMN TaxDistrict,
DROP COLUMN PropertyAddress;

ALTER TABLE `nashville housing data 2`
DROP COLUMN SaleDate;

