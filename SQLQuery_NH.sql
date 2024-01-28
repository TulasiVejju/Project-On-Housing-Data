select *
from PortfolioProject..NashvilleHousing

--Standartize DateFormat

select SaleDateconverted
from PortfolioProject..NashvilleHousing


alter table nashvillehousing
add saledateconverted date;


update NashvilleHousing
set SaleDateconverted = CONVERT(date, saledate)

--populate property address data

select*
from PortfolioProject..NashvilleHousing
order by ParcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull (a.propertyAddress, b.PropertyAddress)
from PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
on a.parcelID = b.parcelID
and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

update a
set PropertyAddress = isnull (a.propertyAddress, b.PropertyAddress)
from PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
on a.parcelID = b.parcelID
and a.[UniqueID ] <> b.[UniqueID ]