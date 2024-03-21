/*
Cleanning Data in SQL queries
*/

Select*
From PortfolioProject..[Nashville Housing]

----------------------------------------------------------------------------------------------------------------------

--Standardize Date Formt

Select SaleDate
From PortfolioProject..[Nashville Housing]

Select SaleDate,CONVERT(Date,SaleDate)
From PortfolioProject..[Nashville Housing]

Alter Table PortfolioProject..[Nashville Housing]
Add SaleDateConverted Date;

Update PortfolioProject..[Nashville Housing]
Set SaleDateConverted = CONVERT(Date,SaleDate)

Select SaleDateConverted,CONVERT(Date,SaleDate)
From PortfolioProject..[Nashville Housing]

----------------------------------------------------------------------------------------------------------------------

--Populate Property Address Data

Select PropertyAddress
From PortfolioProject..[Nashville Housing]
Where PropertyAddress is Null


Select*
From PortfolioProject..[Nashville Housing]
Where PropertyAddress is Null

Select*
From PortfolioProject..[Nashville Housing]
--Where PropertyAddress is Null
Order By [UniqueID ]

Select*
From PortfolioProject..[Nashville Housing]
--Where PropertyAddress is Null
Order By ParcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID,b.PropertyAddress
From PortfolioProject..[Nashville Housing]  a
Join PortfolioProject..[Nashville Housing]  b
	On a.ParcelID = b.ParcelID
	And a.[UniqueID ]<>b.[UniqueID ]
Where a.PropertyAddress is null


Select a.ParcelID, a.PropertyAddress, b.ParcelID,b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject..[Nashville Housing]  a
Join PortfolioProject..[Nashville Housing]  b
	On a.ParcelID = b.ParcelID
	And a.[UniqueID ]<>b.[UniqueID ]
Where a.PropertyAddress is null

Update a
Set PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject..[Nashville Housing]  a
Join PortfolioProject..[Nashville Housing]  b
	On a.ParcelID = b.ParcelID
	And a.[UniqueID ]<>b.[UniqueID ]
Where a.PropertyAddress is null

--Braking Out Adress into Individual columns (Adress - City- State)

Select PropertyAddress
From PortfolioProject..[Nashville Housing]

Select
SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)) As Address

From PortfolioProject..[Nashville Housing]

-- we need to fix the comma in the end of the text

Select
SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) As Address

From PortfolioProject..[Nashville Housing]

-- Now we nned to show the City

Select
SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) As Address
,SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress)) As City
From PortfolioProject..[Nashville Housing]

-- Use Alter Table

Alter Table PortfolioProject..[Nashville Housing]
Add ProprtySplitAddress Nvarchar(255);

Update PortfolioProject..[Nashville Housing]
Set ProprtySplitAddress = SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)

Alter Table PortfolioProject..[Nashville Housing]
Add ProprtySplitCity Nvarchar(255);

Update PortfolioProject..[Nashville Housing]
Set ProprtySplitCity = SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress))

Select*
From PortfolioProject..[Nashville Housing]

-- Braking down the Owner Address

Select OwnerAddress
From PortfolioProject..[Nashville Housing]

Select
PARSENAME(Replace(OwnerAddress,',','.'),3),
PARSENAME(Replace(OwnerAddress,',','.'),2),
PARSENAME(Replace(OwnerAddress,',','.'),1)
From PortfolioProject..[Nashville Housing]

Alter Table PortfolioProject..[Nashville Housing]
Add OwnerSplitAddress Nvarchar(255);

Update PortfolioProject..[Nashville Housing]
Set OwnerSplitAddress = PARSENAME(Replace(OwnerAddress,',','.'),3)

Alter Table PortfolioProject..[Nashville Housing]
Add OwnerSplitCity Nvarchar(255);

Update PortfolioProject..[Nashville Housing]
Set OwnerSplitCity = PARSENAME(Replace(OwnerAddress,',','.'),2)

Alter Table PortfolioProject..[Nashville Housing]
Add OwnerSplitState Nvarchar(255);

Update PortfolioProject..[Nashville Housing]
Set OwnerSplitState = PARSENAME(Replace(OwnerAddress,',','.'),1)

Select*
From PortfolioProject..[Nashville Housing]

----------------------------------------------------------------------------------------------------------------------

--Change Y and N to Yes and No in "Sold as Vacant" column

Select *
From PortfolioProject..[Nashville Housing]

Select SoldAsVacant
From PortfolioProject..[Nashville Housing]

Select SoldAsVacant, Count(SoldAsVacant)
From PortfolioProject..[Nashville Housing]
Group by SoldAsVacant
Order by 2

Select SoldAsVacant,
Case When SoldAsVacant = 'Y' then 'Yes'
	 When SoldAsVacant = 'N' then 'No'
	 Else SoldAsVacant
	 End
From PortfolioProject..[Nashville Housing]

Update PortfolioProject..[Nashville Housing]
Set SoldAsVacant = Case When SoldAsVacant = 'Y' then 'Yes'
						When SoldAsVacant = 'N' then 'No'
						Else SoldAsVacant
						End

Select SoldAsVacant, Count(SoldAsVacant)
From PortfolioProject..[Nashville Housing]
Group by SoldAsVacant
Order by 2

Select*
From PortfolioProject..[Nashville Housing]

----------------------------------------------------------------------------------------------------------------------

--Remove duplicates

Select*,
ROW_NUMBER() Over(
Partition By ParcelID,
			 PropertyAddress,
			 SalePrice,
			 SaleDate,
			 LegalReference
			 Order By UniqueID
			 ) row_num
From PortfolioProject..[Nashville Housing]
order By ParcelID


--With RowNumCTE As(
--Select*,
--ROW_NUMBER() Over(
--Partition By ParcelID,
--			 PropertyAddress,
--			 SalePrice,
--			 SaleDate,
--			 LegalReference
--			 Order By UniqueID
--			 ) row_num
--From PortfolioProject..[Nashville Housing]
--)
--Select*
--From RowNumCTE


--With RowNumCTE As(
--Select*,
--ROW_NUMBER() Over(
--Partition By ParcelID,
--			 PropertyAddress,
--			 SalePrice,
--			 SaleDate,
--			 LegalReference
--			 Order By UniqueID
--			 ) row_num
--From PortfolioProject..[Nashville Housing]
--)
--Select*
--From RowNumCTE
--Where row_num > 1
--Order By PropertyAddress

With RowNumCTE As(
Select*,
ROW_NUMBER() Over(
Partition By ParcelID,
			 PropertyAddress,
			 SalePrice,
			 SaleDate,
			 LegalReference
			 Order By UniqueID
			 ) row_num
From PortfolioProject..[Nashville Housing]
)
Delete
From RowNumCTE
Where row_num > 1


Select*,
ROW_NUMBER() Over(
Partition By ParcelID,
			 PropertyAddress,
			 SalePrice,
			 SaleDate,
			 LegalReference
			 Order By UniqueID
			 ) row_num
From PortfolioProject..[Nashville Housing]
order By ParcelID

----------------------------------------------------------------------------------------------------------------------

--Delete Unused Columns

Select*
From PortfolioProject..[Nashville Housing]

Alter Table PortfolioProject..[Nashville Housing]
Drop Column	PropertyAddress, TaxDistrict, OwnerAddress

Alter Table PortfolioProject..[Nashville Housing]
Drop Column	SaleDate