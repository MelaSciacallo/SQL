/*
Cleaning Data in SQL Queries
*/

Select * 
From PortfolioProject..NashvilleHousing


-------------------------------------------------------------------------------

-- Standardize Date Format

Select SaleDateConverted, Convert(Date,SaleDate)
From PortfolioProject..NashvilleHousing

Update NashvilleHousing
Set SaleDate = Convert(Date,SaleDate)

-- If it doesn't Update properly

Alter Table NashvilleHousing
Add SaleDateConverted Date;


Update NashvilleHousing
Set SaleDateConverted = CONVERT(Date,SaleDate)



---------------------------------------------------------------------------------

-- Populate Property Address data

 Select*
 From PortfolioProject..NashvilleHousing
 --where PropertyAddress is null
 Order by ParcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress,Isnull(a.PropertyAddress,b.PropertyAddress)
 From PortfolioProject..NashvilleHousing a
 Join  PortfolioProject..NashvilleHousing b
	  on a.ParcelID = b.ParcelID
	And a.[UniqueID ]<> b.[UniqueID ]
Where a.PropertyAddress is null

Update a
Set PropertyAddress = Isnull(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject..NashvilleHousing a
 Join  PortfolioProject..NashvilleHousing b
	  on a.ParcelID = b.ParcelID
	And a.[UniqueID ]<> b.[UniqueID ]
Where a.PropertyAddress is null

------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)

 Select PropertyAddress
 From PortfolioProject..NashvilleHousing
 --where PropertyAddress is null
 --Order by ParcelID

 Select 
 SUBSTRING(PropertyAddress,1, CHARINDEX(',', PropertyAddress)-1) Address
 , SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress)) City
 From PortfolioProject..NashvilleHousing


Alter Table PortfolioProject..NashvilleHousing
Add PropertySplitAddress nvarchar (255);


Update PortfolioProject..NashvilleHousing
Set PropertySplitAddress = SUBSTRING(PropertyAddress,1, CHARINDEX(',', PropertyAddress)-1)



Alter Table PortfolioProject..NashvilleHousing
Add PropertySplitCity nvarchar (255);


Update PortfolioProject..NashvilleHousing
Set PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress))

Select * 
From PortfolioProject..NashvilleHousing



Select OwnerAddress
From PortfolioProject..NashvilleHousing


Select 
PARSENAME(REPLACE(OwnerAddress,',','.'),3) 
,PARSENAME(REPLACE(OwnerAddress,',','.'),2) 
,PARSENAME(REPLACE(OwnerAddress,',','.'),1)
From PortfolioProject..NashvilleHousing



Alter Table PortfolioProject..NashvilleHousing
Add OwnerSplitAddress nvarchar (255);


Update PortfolioProject..NashvilleHousing
Set OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'),3)



Alter Table PortfolioProject..NashvilleHousing
Add OwnerSplitCity nvarchar (255);


Update PortfolioProject..NashvilleHousing
Set OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2)

Alter Table PortfolioProject..NashvilleHousing
Add OwnerSplitState nvarchar (255);


Update PortfolioProject..NashvilleHousing
Set OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'),1)


---------------------------------------------------------------------------------------

-- Change Y and N to Yes and No in "Sold as Vacant" field

Select Distinct(SoldAsVacant), COUNT(SoldAsVacant)
From PortfolioProject..NashvilleHousing
Group by SoldAsVacant
Order by 2


Select SoldAsVacant
, Case When SoldAsVacant = 'Y' Then 'Yes'
       When SoldAsVacant = 'N' Then 'No'
	   Else SoldAsVacant
	   End
From PortfolioProject..NashvilleHousing

Update PortfolioProject..NashvilleHousing
Set SoldAsVacant = 
Case When SoldAsVacant = 'Y' Then 'Yes'
       When SoldAsVacant = 'N' Then 'No'
	   Else SoldAsVacant
	   End


----------------------------------------------------------------------------------------

-- Remove Duplicates

With RowNumCTE As(
Select*,
	Row_Number () Over (
	Partition by ParcelID,
				 PropertyAddress,
				 SaleDate,
				 SalePrice,
				 LegalReference
				 Order by
				    UniqueId
					) row_num

From PortfolioProject..NashvilleHousing
)
Select *
From RowNumCTE
Where row_num >1
order by PropertyAddress



-----------------------------------------------------------------------------------------

-- Delete Unused Columns

Select * 
From PortfolioProject..NashvilleHousing

Alter Table PortfolioProject..NashvilleHousing
Drop column PropertyAddress, OwnerAddress,TaxDistrict, SaleDate

